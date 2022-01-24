class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.33.tar.gz"
  sha256 "588c7615dc2324a104cf08cd658e372f4357a91e63666946a6b15cc1c1a3a4e4"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.33"
    sha256 cellar: :any_skip_relocation, big_sur:      "aa735cb204bc01c6f5630318d6baeedc15a7190a42a1ec4f9ab4212afdc673c1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a64fbc5a2355a6d5ed6bb28159ab3c77c3df2f4d4329da09036cae85fd98576c"
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
