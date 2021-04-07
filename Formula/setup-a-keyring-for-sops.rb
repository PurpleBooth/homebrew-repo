class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.0.tar.gz"
  sha256 "02e4754a07a65d83434b3eea119408580055cd26909e4fbdb1d1713f83221d5e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.0"
    sha256 cellar: :any_skip_relocation, catalina:     "a11b74dafbde2751b7b83d309431c06a9e3bcf1b605b6b31ed0d8adba9beae44"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "32323551a3cd54e44e39ae866122502baf0ff5dc32c41893ad2db37740b5b419"
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
