#!/usr/bin/env bash

set -euo pipefail

PACKAGES=()
PACKAGES_FULL=()

for I in Formula/*.rb; do
	PACKAGES+=("$(echo "$I" | sed -e 's/^Formula\/*//' | sed -e 's/.rb$//')")
	PACKAGES_FULL+=("purplebooth/repo/$(echo "$I" | sed -e 's/^Formula\/*//' | sed -e 's/.rb$//')")
done

brew install --only-dependencies --verbose --build-bottle "${PACKAGES_FULL[@]}"
brew install --verbose --build-bottle "${PACKAGES_FULL[@]}"

for PACKAGE in "${PACKAGES[@]}"; do
	brew bottle --verbose --json "$PACKAGE" --root-url="$BINTRAY_DL_URL"
done

for BOTTLE_JSON in ./*.bottle.json; do
	brew bottle --merge --write "$BOTTLE_JSON"
done

for PACKAGE in "${PACKAGES[@]}"; do
	curl \
		"$BINTRAY_API_URL/packages/$BINTRAY_ORG/$PACKAGE" \
		-u "$HOMEBREW_BINTRAY_USER:$HOMEBREW_BINTRAY_KEY" \
		-X POST \
		-d "{ \"name\": \"$PACKAGE\", \"vcs_url\": \"https://github.com/PurpleBooth/$PACKAGE.git\", \"github_repo\": \"PurpleBooth/$PACKAGE\", \"public_download_numbers\": false, \"public_stats\": true }" || echo "Package probably already exists..."
done

brew test-bot \
	--ci-upload \
	--bintray-org="$BINTRAY_ORG" \
	--root-url="$BINTRAY_DL_URL"
