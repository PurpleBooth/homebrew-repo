class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.46.73.tar.gz"
  sha256 "d50a539a3d73b92ba093adfeb337c72cadd2774133078ef25b62be5f04d869ac"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.73"
    sha256 cellar: :any_skip_relocation, big_sur:      "d53b56dc336147fa7fbd247883c1337bcfd90a1e964eeb0e491d2c0c5d944405"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2662b839f4ace2d64f38f17cb58cc59ff513cdcf2b291cb46ff9558c09717935"
  end

  depends_on "rust" => :build
  depends_on "zsh"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fix-compaudit", "-h"
    system "#{bin}/fix-compaudit", "-V"
  end
end
