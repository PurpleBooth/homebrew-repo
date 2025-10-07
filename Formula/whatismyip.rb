class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://codeberg.org/PurpleBooth/whatismyip"
  url "https://codeberg.org/PurpleBooth/whatismyip/archive/v0.15.16.tar.gz"
  sha256 "145e8c245ed7dfa317bd8df0d2bf666552e74f06f9fc8d94017277ddf4b2243b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.15.16"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d4540da55fb2fd47a8350f2b5f88fd1a3e60063c1258e9c7578052908f20c6fe"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "87b1249517ab6ab89e164066aef3cdf46f9440be1c78660e1bddd0018894e76d"
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
