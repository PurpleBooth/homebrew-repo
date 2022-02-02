class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.37.tar.gz"
  sha256 "62938aac8293bc94a42e395572ca278c0da952d45da832c7a541f0d0893ec1a1"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.37"
    sha256 cellar: :any_skip_relocation, big_sur:      "4f8474bd41ebcb754c45fb29f73e3dfbe347e326a7664d6e17daa8a400ecdc39"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2954c5f55435fc44f8bdac42af7994313b11e86a43f45b3e808d815c0b3f34a7"
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
