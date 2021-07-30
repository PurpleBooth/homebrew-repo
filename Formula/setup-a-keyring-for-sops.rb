class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.9.tar.gz"
  sha256 "212146ef2b27938dd2e1943b639c023c7dbb57e155edff551602e561d303c169"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.9"
    sha256 cellar: :any_skip_relocation, catalina:     "515dd1332781dfde84745305a1f5fcd2ee86d80a9248efe10437b100e76c6af3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "50105bfbcf646dc5608882a6145dc49e028eaacc598a554cda4c1a151505419e"
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
