class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.40.tar.gz"
  sha256 "21099919a596ea607b27fc78f68ca92fca50c1aa8b327f76868f2db3d5fc38fc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.40"
    sha256 cellar: :any_skip_relocation, big_sur:      "1465f72024ecbb3da77a0f38ad9c3a04d0fec62dc79015bd259f2ee40b1888cb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "adc78b2bb8598cd5355e5ab764a84b0f366586b69fc789d838e4626361b134e6"
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
