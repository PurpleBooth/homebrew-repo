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
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/v0.5.0.tar.gz"
  version "0.5.0"
  sha256 "cd7d22f8be897d73140516aa37465aa251254dca5b9674cf43d1a8715c0f595e"

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
