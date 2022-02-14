class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.38.tar.gz"
  sha256 "4b22a379077c6bcd55df71c52187f8cfb4530c8f1e5ed38e5c55b115bd7de6f8"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.38"
    sha256 cellar: :any_skip_relocation, big_sur:      "056803f6b2ccf031f937dc7858e9afbf26805560f0a19be4549e373c265466ab"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d8f036083c4d398db555b50cf8f729faddfe56fd7b7874e92d1f6d593862cf7c"
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
