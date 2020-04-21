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
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/v0.3.0.tar.gz"
  version "0.3.0"
  sha256 "abf12c3cf5d538d1e2e25d33fb15265418bb0d0bd879c314b8e1576944261fc0"

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
