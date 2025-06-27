class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://codeberg.org/PurpleBooth/whatismyip"
  url "https://codeberg.org/PurpleBooth/whatismyip/archive/main.tar.gz"
  version "0.14.4"
  sha256 "a724366db3bc49267a332010423390aa20f87097b0449fee3dd376317bf5f76b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.14.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8eab2fbf1de23da0103e47a22f2cec316e0a62b8d65be9d972c4dcab6dcec6e8"
    sha256 cellar: :any_skip_relocation, ventura:       "53b67b1e0b4b4f9a45a9c61f94ce1feca793c9f1684fce8795b097f503c26158"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "567b36f3990055fd052af74ab326a414ecfdc87cb03369acf2d30a8b02ca3b79"
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
