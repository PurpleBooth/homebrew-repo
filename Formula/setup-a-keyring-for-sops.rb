class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.3.tar.gz"
  sha256 "f9743ebf8db134a429ff90107dc5f1e15934d14464e9221847a490930f03702d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.3"
    sha256 cellar: :any_skip_relocation, catalina:     "f2cddb2468f3aead2edcc1503531a71466a81a4b991b7ff7b20d5ad61095fa7c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bbe7f6269137f96a32dbe507e695058a8623ebbfb05b5d8fce28129465dc5bc8"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  def caveats
    <<~EOS
      At runtime, gcloud must be accessible from your PATH.
      You can install gcloud from Homebrew Cask:
        brew cask install google-cloud-sdk
    EOS
  end

  test do
    system "#{bin}/setup-a-keyring-for-sops", "-h"
    system "#{bin}/setup-a-keyring-for-sops", "-V"
  end
end
