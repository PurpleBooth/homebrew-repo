#!/usr/bin/env bash

set -xeuo pipefail

PACKAGES=()
PACKAGES_FULL=()

for I in Formula/*.rb; do
	PACKAGES+=("$(echo "$I" | sed -e 's/^Formula\/*//' | sed -e 's/.rb$//')")
	PACKAGES_FULL+=("purplebooth/repo/$(echo "$I" | sed -e 's/^Formula\/*//' | sed -e 's/.rb$//')")
done

brew test "${PACKAGES_FULL[@]}"
