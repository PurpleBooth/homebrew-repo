class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.12.tar.gz"
  sha256 "06b674ab687c040a65d60ef79f6248392b43b301eb49b72553723a05528b8293"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.12"
    sha256 cellar: :any_skip_relocation, catalina:     "e2c62b5ba24a7a09773edd31bae63f65ac618306f5b5b1bd55b2dcc083119dbe"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0ccb0bc73c25d9d6511d446656979f5273c333b06d25d59600bca2b1e8d3523d"
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
