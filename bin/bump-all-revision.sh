#!/usr/bin/env bash

set -xeuo pipefail

for I in Formula/*.rb; do
	brew bump-revision "purplebooth/repo/$(echo "$I" | sed -e 's/^Formula\/*//' | sed -e 's/.rb$//')"
done
