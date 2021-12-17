class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.23.tar.gz"
  sha256 "56c864539cc7f7cf5d1334f4634f9c4fabe26db4140f9b4433c630915067464a"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.23"
    sha256 cellar: :any_skip_relocation, big_sur:      "1b2cd2265f5d5ea581587d6dfe6208dc656ca5476cd3561fce4ea7fb1e0030f0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "da8b7ff72f18cbcba10b76e143b921e9d5114bbc0ef44fa349a46aa6e2688a54"
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
