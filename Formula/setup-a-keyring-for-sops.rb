class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.8.tar.gz"
  sha256 "cae6ca9ee2e7ea39d4c993a0007927419c8bd0627a00fc67f38826423dc05ac0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.8"
    sha256 cellar: :any_skip_relocation, catalina:     "116a0968a67c4817425f1cf2ea96e1ea72f1848ee7950a07d41b2434248f005e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "badf98da9f28e53976129155d3423ba189472bdd4e858992e19216a6c575fc09"
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
