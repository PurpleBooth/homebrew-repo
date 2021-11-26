class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.19.tar.gz"
  sha256 "681da87db209c3b9d554727fe3c7b45105082698f8f9fed01d65ddcf834a63aa"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.19"
    sha256 cellar: :any_skip_relocation, catalina:     "5d3031d24cc15814d83532066e77aa4a175e0e1617482f05090485c0987ce0fe"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e24300314e8944120feb2138d7883862f81187a4a540b2aec4d4ebcbaca78626"
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
