class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.20.tar.gz"
  sha256 "ecff30a6c22e7b7ce034a85a6f59ced7523e4a8c31221f46dfe1acb51f3ea4b3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.20"
    sha256 cellar: :any_skip_relocation, catalina:     "feb6925bcc8b1ee79e7d64fdca65eca9db509e18706e0dc6c3d7ce7b92c5c2b0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4095f78d18b6e951746f897c9073c074a08d023adaf077443488124d26982e72"
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
