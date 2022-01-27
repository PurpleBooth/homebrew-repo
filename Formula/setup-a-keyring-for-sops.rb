class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.36.tar.gz"
  sha256 "777362df5175a1bce4fb6cb2b23c97024b91b7e77844e5dfe9e6df85376f623e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.36"
    sha256 cellar: :any_skip_relocation, big_sur:      "ca4af77b5bf861c485768ed7963b5631eba3878ae6305d412874a311364d641e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c694f33ae38aa337a3b1bb2f7203089e043c13fe4a55e144f2cf9f29c839848d"
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
