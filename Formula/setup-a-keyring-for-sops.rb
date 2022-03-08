class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.44.tar.gz"
  sha256 "99e19692233877c0fc5eb88d2fbd2c2253f5b9bd42333b0091da0b408e48cfc5"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.44"
    sha256 cellar: :any_skip_relocation, big_sur:      "7b4c29578f94940e415a938c697bc7ee69d66b77dcf98af6a715d0981f623230"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a44c3eb2430d899469d0b3f15e6c377ea3cb88eb7cec99df80726b1b93ae2854"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  def caveats
    <<~EOS
      At runtime, gcloud must be accessible from your PATH.
      You can install gcloud from Homebrew Cask:
        brew install google-cloud-sdk
    EOS
  end

  test do
    system "#{bin}/setup-a-keyring-for-sops", "-h"
    system "#{bin}/setup-a-keyring-for-sops", "-V"
  end
end
