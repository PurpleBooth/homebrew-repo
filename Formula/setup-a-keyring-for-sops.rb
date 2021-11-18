class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.18.tar.gz"
  sha256 "83f1fb589b79bb2fd26617ba1537e8ec93c1e5d171bd75413d88bc20289e2153"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.18"
    sha256 cellar: :any_skip_relocation, catalina:     "79d3d5bebdfbcc56732d5429683abf5cd44ab482c907e8095a7f646202fbb3fd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "021b941c7e6018fe2f038d1f699df44ac2a2d5b431c8495c932dee7d4f9bf445"
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
