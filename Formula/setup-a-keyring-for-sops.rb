class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.41.tar.gz"
  sha256 "b655d7c32ebea8f93297879f66bba0340b15d206f33d51c0b723919f659e587b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.41"
    sha256 cellar: :any_skip_relocation, big_sur:      "8fe5fbd1759f0f36d4f607c7fb778896790ef02f06b4c9f3e9f69d7eb7add5bf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5c86c6899a1cb668dd2943442c9bb68857beb8bd86bf401e61b667ab0850c044"
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
