class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.30.tar.gz"
  sha256 "512cf540f47e4a8cd6fa15d9612cd3ce8fafa719cd9125a67dff61f68dc355bc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.30"
    sha256 cellar: :any_skip_relocation, big_sur:      "36f9d462b946bad4e4de7d3817dfc078095a70b1fc3389bf4f9b633caee36c83"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4c4069e60adeced69f13b92fb778a6f8690b8aba00ed479fb285afeb90110427"
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
