#!/usr/bin/env bash

set -xeuo pipefail

mkdir -p "$(brew --repo)/Library/Taps/purplebooth"
ln -s ./. "$(brew --repo)/Library/Taps/purplebooth/homebrew-repo"
