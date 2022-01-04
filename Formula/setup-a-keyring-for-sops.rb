class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.25.tar.gz"
  sha256 "171eb5951b26bf4c9b8597e9da2df57d17a398657bc129f5400dc574fb7fd793"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.25"
    sha256 cellar: :any_skip_relocation, big_sur:      "3cd949b77e93541a6d52fb059c20757a8764185f13a4ab0ea8373be7cd68ed33"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "12b3c16f02dc9ecc802a5345c8d597029b146d3a9764b6b9e96c58b7ea8d0851"
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
