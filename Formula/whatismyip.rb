class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://codeberg.org/PurpleBooth/whatismyip"
  url "https://codeberg.org/PurpleBooth/whatismyip/archive/v0.15.20.tar.gz"
  sha256 "719a2527953905fbd974dccbb5d4d820b792bd915ea7414b87011fff8a32069d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.15.20"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "48fecbaaa1f4c7dcd712081f7cec2bacfd301310456000a99bf56fc4b8f89932"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "02c326af2a7fc0d79e1811650b2487362b82df97c5b37700c8b1f231216922a2"
  end
  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/whatismyip", "-h"
    system "#{bin}/whatismyip", "-V"
  end
end
