#!/usr/bin/env bash

set -xeuo pipefail

PACKAGES=()
PACKAGES_FULL=()

for I in Formula/*.rb; do
	PACKAGES+=("$(echo "$I" | sed -e 's/^Formula\/*//' | sed -e 's/.rb$//')")
	PACKAGES_FULL+=("purplebooth/repo/$(echo "$I" | sed -e 's/^Formula\/*//' | sed -e 's/.rb$//')")
done

function build_publish() {
	brew test-bot \
		--bintray-org="$BINTRAY_ORG" \
		--root-url="$BINTRAY_DL_URL" \
		--skip-setup \
		"$1" &&
		brew test-bot \
			--ci-upload \
			--bintray-org="$BINTRAY_ORG" \
			--root-url="$BINTRAY_DL_URL" \
			--publish \
			"$1"
}

for PACKAGE in "${PACKAGES[@]}"; do
	curl \
		"$BINTRAY_API_URL/packages/$BINTRAY_ORG/$PACKAGE" \
		-u "$HOMEBREW_BINTRAY_USER:$HOMEBREW_BINTRAY_KEY" \
		-X POST \
		-H 'Content-Type: application/json' \
		-d "{ \"name\": \"$PACKAGE\", \"vcs_url\": \"https://github.com/PurpleBooth/$PACKAGE.git\", \"github_repo\": \"PurpleBooth/$PACKAGE\", \"public_download_numbers\": true, \"public_stats\": true }" ||
		echo "Package probably already exists..."
done

for PACKAGE in "${PACKAGES_FULL[@]}"; do
	build_publish "$PACKAGE" || (brew bump-revision && build_publish "$PACKAGE")
done

brew test-bot \
	--ci-upload \
	--bintray-org="$BINTRAY_ORG" \
	--root-url="$BINTRAY_DL_URL" \
	--publish
