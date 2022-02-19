class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.39.tar.gz"
  sha256 "b4fb0e9109204fca9d5830c66191fd2389fdbf3b39553a6907d6658b79704443"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.39"
    sha256 cellar: :any_skip_relocation, big_sur:      "f4b602f6d2ff71b2e98ac108919635168660fbe3231d586f09e8a9be27979054"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "97c311c8c888454409ac2812142eae1489428ad026737be80a92cebcdee5b1d4"
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
