class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.11.tar.gz"
  sha256 "c17df2d77209262b78186020a86f0c87f5f79fc5866e90b774fb27ff39713332"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.11"
    sha256 cellar: :any_skip_relocation, catalina:     "5f296d9a792411527d7add9e28ef1ca16b547f00abb3cbb8931359bc7aefbfbd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f5fda616f012935b48c8616cfb710a60bdd1d69c0612bd119074b67412757348"
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
