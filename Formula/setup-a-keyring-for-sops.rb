class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.43.tar.gz"
  sha256 "2a5747aca6151955113c925aa8e56ba5c2421258807821cddfad621d1e4103f3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.43"
    sha256 cellar: :any_skip_relocation, big_sur:      "4fde67350cbee2af7ea3fc020fc0aa5460a1e2a91613ea078120f14fce4068c5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f399a6e20cbf5af9c06e16662e41089aee74d3e0132a632ad8f0531651832bde"
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
