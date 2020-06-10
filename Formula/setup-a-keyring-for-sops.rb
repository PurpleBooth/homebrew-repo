class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.36.0.tar.gz"
  sha256 "6d4dab46f391dda7f9a55fb85601e5e14c3da09126c823ead1a86174e876fe76"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "c770d226134c2f7ddb52c6d99fc9311c28f958707f0f25ebb44594477a70e3d6" => :catalina
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
