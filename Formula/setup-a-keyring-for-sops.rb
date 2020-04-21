class GCloudRequirement < Requirement
  fatal true

  satisfy(:build_env => false) { which("gcloud") }

  def message; <<~EOS
    gcloud is required; install it via:
      brew cask install google-cloud-sdk
  EOS
  end
end

class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/v0.4.0.tar.gz"
  version "0.4.0"
  sha256 "fb84b88e0b4ec4418bda0d2f3da04c42c70b84f10b5ae897fbe1a77243ac0c18"

  depends_on "rust" => :build
  depends_on GCloudRequirement

  def install
        ENV['VERSION'] = version
        system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/setup-a-keyring-for-sops", "-h"
    system "#{bin}/setup-a-keyring-for-sops", "-V"
  end
end
