class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.6.tar.gz"
  sha256 "2fec4233ccae4491b4e445fc796f873968c43a74200f86b8607b4b23e99e8c5a"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.6"
    sha256 cellar: :any_skip_relocation, catalina:     "a5a947b3e44b39d79c3ba160d102d4dafca1ec96369c02985b7cafe566a47978"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8a096a1856337931edb31192587c5ff461f92479c7f919b6678ceea81aa623df"
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
