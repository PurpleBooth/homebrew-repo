class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.32.tar.gz"
  sha256 "2e1570beb3d85c89fb9049aaa2c90d58781372d54390ab6261e3ca07d0105ae8"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.32"
    sha256 cellar: :any_skip_relocation, big_sur:      "2159c5a5d489e73caa3eb7bafbc72d205a6a2ea3fbdda16aaf7fa99c36f0f1bd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ae4a96c19630d7e38cedc1d21a4539c39a943a226e4943f315f81ac91a25f92e"
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
