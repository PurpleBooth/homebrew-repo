class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.24.tar.gz"
  sha256 "0f0629adcc9c09935886e97b03e4c37124e895db5c9dfa84ae0cf23e8285bab9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.24"
    sha256 cellar: :any_skip_relocation, big_sur:      "cfb696027e205108d07c5db3486583002eb5aa0a7ed3bd1ba4c69c0f9c49d524"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0d613bce12f73a3f57f10d85be2456e6acd5e688da8cca4493bee863bc4dc3c8"
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
