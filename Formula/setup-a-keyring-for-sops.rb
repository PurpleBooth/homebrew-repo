class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.27.tar.gz"
  sha256 "5813f31be3d01fada43a4bf5c830375943e3bae8056124601b60dc1f8d491c49"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.27"
    sha256 cellar: :any_skip_relocation, big_sur:      "5528c5e381218920903b486082f3de0a32f08ed459effadffb56839b855791b3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d7810f066b3d1f626d752e821eff29c6e27dd126c032fc3a8ddb38fd43102c93"
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
