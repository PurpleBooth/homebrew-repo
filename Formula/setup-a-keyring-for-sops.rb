class SetupAKeyringForSops < Formula
  desc "Use gcloud to setup everything needed for SOPS"
  homepage "https://github.com/PurpleBooth/setup-a-keyring-for-sops"
  url "https://github.com/PurpleBooth/setup-a-keyring-for-sops/archive/refs/tags/v0.42.35.tar.gz"
  sha256 "b5320e39f2b4f2242accb4d98c27209be09e70a87241072d2259a385f21ea72d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/setup-a-keyring-for-sops-0.42.35"
    sha256 cellar: :any_skip_relocation, big_sur:      "2da0ae7b1063a447c499bb2579663dab017c3b18098e12c4bbb8da26710ee57f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d75bf3b0d4325bc9458cb9cea6333c61f5fe9dccabe0e354c51e306bc77f29ec"
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
