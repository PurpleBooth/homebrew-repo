class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/art-station-i-guess/archive/v0.1.2.tar.gz"
  version "0.1.2"
  sha256 "82545577ae01c2b3d2031b7d7d473e38c0cf8374c40e7b6e66ec1169b98900e8"

  depends_on "rust" => :build
  depends_on cask: 'google-cloud-sdk'

  def install
        ENV['VERSION'] = version
        system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/setup-a-keyring-for-sops", "-h"
    system "#{bin}/setup-a-keyring-for-sops", "-V"
  end
end
