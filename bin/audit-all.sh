#!/usr/bin/env bash

set -euo pipefail

for I in Formula/*.rb; do
	brew audit --strict --online --new-formula "purplebooth/repo/$(echo "$I" | sed -e 's/^Formula\/*//' | sed -e 's/.rb$//')"
done
