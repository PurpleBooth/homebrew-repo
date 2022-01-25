class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.34.tar.gz"
  sha256 "36d1c615e7c4f963752248cf1a6bacb64a8c3a426146ce9a0c629b42573584cd"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.34"
    sha256 cellar: :any_skip_relocation, big_sur:      "e773d37fd118920250f895985f738b6e576275c05a46ad393fc80a64c5329355"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "27011cf6ca10372e4b1cbb398ba8d91ea632d1c2cf04a93d9f29d1e5a8b2c754"
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
