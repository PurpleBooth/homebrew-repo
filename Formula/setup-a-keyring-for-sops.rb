class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.21.tar.gz"
  sha256 "c3ec72a4aa2c46bead3c2bb7e9643d3f40341f23cf559f17dfea0d2f77e59e35"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.21"
    sha256 cellar: :any_skip_relocation, catalina:     "c9b89323ceef29f8bf5fdb2af8234d2bbfa6f1b16d1724de8bd63e1c44fa9363"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b5088f0c9dad49b26063d01dcfb485f4b3396028763e4f52c65cd585b7ef0dbf"
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
