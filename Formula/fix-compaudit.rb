class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.46.47.tar.gz"
  sha256 "b037ae90b2f024aa0471fc10bdaef0ccf19cd3d983ac64f76f87646362016ee0"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "e7cfd0146dc63e17b3e90ebfd0bc61d07931e20e493b4e3cf292314a59f1181a" => :x86_64_linux
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
