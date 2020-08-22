class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.46.44.tar.gz"
  sha256 "90f3041839e05c68b1cfc1e2a243aaa5d30d786a21d3dd67b80ef62e59362ad3"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "4654851691e79a3df19a675fa7943e632af915e6ffb2643b7b8ab7bcfe523cb0" => :x86_64_linux
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
