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
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/v0.8.4.tar.gz"
  sha256 "d3602c0fe6a2d800d89eb3d846b458530f53a9a459740b8b91505741d60257cf"

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
