class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.7.tar.gz"
  sha256 "e330a2cf20f3163ee201d03649fc31154573ce05af81f7a7e3a923420a08fb06"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.7"
    sha256 cellar: :any_skip_relocation, catalina:     "38d00b55dd3ab2733fa89f4ef007093e040433a007bb15175ba38c933d5fe5dd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e09efec8e400a810fb33753d334c472a666969ebd49736d4eab25eab049a271b"
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
