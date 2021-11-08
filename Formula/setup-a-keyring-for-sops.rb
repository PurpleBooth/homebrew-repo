class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.16.tar.gz"
  sha256 "66539ce0a933827f6ccaaaee814ad8a70293183664547c6eb87b3bbfb8b6e4dc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.16"
    sha256 cellar: :any_skip_relocation, catalina:     "17d545265cccda8342c54a13d74c599f845d2cf0cac274ce89adb9a0dd8d8c85"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f1d31dea97ccb8ad9301971a10f6650b3acfdc01113bee8335a1643a9dd680b3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  def caveats
    <<~EOS
      At runtime, gcloud must be accessible from your PATH.
      You can install gcloud from Homebrew Cask:
        brew install google-cloud-sdk
    EOS
  end

  test do
    system "#{bin}/setup-a-keyring-for-sops", "-h"
    system "#{bin}/setup-a-keyring-for-sops", "-V"
  end
end
