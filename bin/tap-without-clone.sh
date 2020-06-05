#!/usr/bin/env bash

set -xeuo pipefail

mkdir -p "$(brew --repo)/Library/Taps/purplebooth"
cp -r ./. "$(brew --repo)/Library/Taps/purplebooth/homebrew-repo"
