class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.0.tar.gz"
  sha256 "470dd5f27b36d3e2b740613d670b69744e1af49ecf0935ddf160816187bd614d"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "aa7c971f92f8eb6ddd2939cb657507dc22122b2476e2ccd92cfe8d81d7f4d045" => :x86_64_linux
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
