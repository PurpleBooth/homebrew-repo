class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.21.0.tar.gz"
  sha256 "2ae57bd05676240bde0256a9739b8bc9c3b4e23e0c807817c2efbcb3d536adc1"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "e06872d207e88cfdcb72edaa6bf3a78d5fef90d1fd87ab62f2cd26fa1fededf2" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  def caveats
    <<~EOS
      At runtime, gcloud must be accessible from your PATH.
      You can install gcloud from Homebrew Cask:
        brew cask install google-cloud-sdk
    EOS
  end

  test do
    system "#{bin}/setup-a-keyring-for-sops", "-h"
    system "#{bin}/setup-a-keyring-for-sops", "-V"
  end
end
