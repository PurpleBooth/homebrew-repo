class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.4.tar.gz"
  sha256 "33f91cd363f9921784cf51961609b5fb0cdc52d399f089182932bec0b1ea8404"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.4"
    sha256 cellar: :any_skip_relocation, catalina:     "9c8fb58eaf666cf696911ea8c7f032ea7733799a8dbbc67d2253f3dc49503f83"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0a47bbefcc32d196b08e3ad79820cd1d50b73e1787b96318456ca8b1f59b2190"
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
