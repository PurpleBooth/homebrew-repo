class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.26.tar.gz"
  sha256 "609dfc1b9f38fed08a66fe89d86ad969db508fc6bad1d9634710eedaaa2c7dc3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.26"
    sha256 cellar: :any_skip_relocation, big_sur:      "f3cbb51ce9e6bfb647439b038a7d7803fdaab92fd92ef954913f875ae1274669"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6eebea06f45397d74475975e5acfde27df6d2c219e082262f96c2a47bf695e57"
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
