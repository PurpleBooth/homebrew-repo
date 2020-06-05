#!/usr/bin/env bash

set -euo pipefail

PACKAGES=()

for I in Formula/*.rb; do
	PACKAGES+=("purplebooth/repo/$(echo "$I" | sed -e 's/^Formula\/*//' | sed -e 's/.rb$//')")
done

brew install "${PACKAGES[@]}"
