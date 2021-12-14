class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.22.tar.gz"
  sha256 "43de7908a608358fc6ae3bc6792c47af166aa297b3e815d8913430873132e717"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.22"
    sha256 cellar: :any_skip_relocation, big_sur:      "9edfbc812805d007dadc1e32514a08439df23476c4b8f9531847d5963375ad5b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5205eaa74a04c45dbe0d87f5605538e54cee7f4aae0e945f8c02883d02c2f350"
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
