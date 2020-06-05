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
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/v0.14.0.tar.gz"
  sha256 "d36826e7fab5b5a7394f92e8d19717a61de9fc8867eff2064ffab165c47efe90"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "6f090ce14855a4b3d2c3ee2f5476682b4f0dfedd682277a0cc7ddc49b9a8883e" => :catalina
  end

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
