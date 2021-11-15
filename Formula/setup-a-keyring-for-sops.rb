class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.17.tar.gz"
  sha256 "d6801d27b61ce96f4c87a72b1665729d4faa32285bd22e4814dd9cdfaf1a1315"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.17"
    sha256 cellar: :any_skip_relocation, catalina:     "746d12582a581b718152ed21a48c19eaa779a7194862a664d62b4d8deece3007"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b434ecfdddd0a0457f63d18aaa81754ae94dde804b73d3e9934602a27be66cc8"
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
