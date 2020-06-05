#!/usr/bin/env bash

set -xeuo pipefail

{
	cd "$(brew --repo)/Library/Taps/purplebooth/homebrew-repo"
	git pull --rebase
	git push
}
