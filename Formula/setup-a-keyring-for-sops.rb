class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.29.tar.gz"
  sha256 "a3c67bd35111323340bdcd4d5fd409a21c8a8dbf4d84cbc5baa3943bcb1c5be1"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.29"
    sha256 cellar: :any_skip_relocation, big_sur:      "6b42f1848ce6c1f95914096ee0c0f8d66b186021edbc168b71e21ad1b98ee9a3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f1c8e528904b01ea0eb788049f6b54019fe0dc031253c19d139fafe74b92d5fa"
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
