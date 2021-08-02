class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.10.tar.gz"
  sha256 "5f2afc50867576dccb6834be4f1b001582199594bb94e39321cb451a7e52b4a2"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.10"
    sha256 cellar: :any_skip_relocation, catalina:     "e3c35b28c11ae77137f286d753c37cf3f261e63ad06e773814821d9da73e828e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fd860b52b55456943328354fb9a19f27de6d3a5f29fdc5a80f1b34e68e47e16d"
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
