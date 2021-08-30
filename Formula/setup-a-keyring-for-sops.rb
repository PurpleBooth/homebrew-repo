class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.13.tar.gz"
  sha256 "cfdee844b75a395fbc4751df3b3e99bd8850a04c803e059054997aa1f4bfdd4f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.13"
    sha256 cellar: :any_skip_relocation, catalina:     "3906a8f4c039d32c5b90e1e31bb80ec4008bbaa47aa17cace4bcb8b0040fecde"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2e8f9b29d420ae93d64cbed7f4d9283f0ed14ee46b15a2b29ad20bda73dd78c7"
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
