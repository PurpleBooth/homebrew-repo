class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.28.tar.gz"
  sha256 "8d375a34b3bc794d9804f5e211ce05689486b9f04b4deabce894a06859853c85"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.28"
    sha256 cellar: :any_skip_relocation, big_sur:      "11a59a19a809a11ff0ecb8f02981c64ce4741357ae4bd60de2734ed7c3489ac6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "89f20f58042d9750b59594aa33049e0259ad8cff790b99494e0c7ef4776ecafd"
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
