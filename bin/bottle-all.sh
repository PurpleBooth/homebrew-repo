#!/usr/bin/env bash

set -xeuo pipefail

PACKAGES=()
PACKAGES_FULL=()

for I in Formula/*.rb; do
	PACKAGES+=("$(echo "$I" | sed -e 's/^Formula\/*//' | sed -e 's/.rb$//')")
	PACKAGES_FULL+=("purplebooth/repo/$(echo "$I" | sed -e 's/^Formula\/*//' | sed -e 's/.rb$//')")
done

brew install --only-dependencies --verbose --build-bottle "${PACKAGES_FULL[@]}"
brew install --verbose --build-bottle "${PACKAGES_FULL[@]}"
brew bottle --verbose --json "${PACKAGES_FULL[@]}" --root-url="$BINTRAY_DL_URL"
brew bottle --merge --write ./*.bottle.json

for PACKAGE in "${PACKAGES[@]}"; do
	curl \
		"$BINTRAY_API_URL/packages/$BINTRAY_ORG/$PACKAGE" \
		-u "$HOMEBREW_BINTRAY_USER:$HOMEBREW_BINTRAY_KEY" \
		-X POST \
		-H 'Content-Type: application/json' \
		-d "{ \"name\": \"$PACKAGE\", \"vcs_url\": \"https://github.com/PurpleBooth/$PACKAGE.git\", \"github_repo\": \"PurpleBooth/$PACKAGE\", \"public_download_numbers\": true, \"public_stats\": true }" ||
		echo "Package probably already exists..."
done

brew test-bot \
	--ci-upload \
	--bintray-org="$BINTRAY_ORG" \
	--root-url="$BINTRAY_DL_URL" \
	--publish
