class GCloudRequirement < Requirement
  fatal true

  satisfy(:build_env => false) { which("gcloud") }

  def message
    <<~EOS
    gcloud is required; install it via:
      brew cask install google-cloud-sdk
  EOS
  end
end

class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/v0.8.0.tar.gz"
  sha256 "f2e37b99b5630f2839388273703a350d88884c07327732944d5e9af8b0cfcbf7"

  depends_on "rust" => :build
  depends_on GCloudRequirement

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/setup-a-keyring-for-sops", "-h"
    system "#{bin}/setup-a-keyring-for-sops", "-V"
  end
end
