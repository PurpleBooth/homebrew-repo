class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.46.60.tar.gz"
  sha256 "896cebe269c3d6a2d05f3fc38827b640543d97a7f9ab99027fc745bd618efcee"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.60"
    sha256 cellar: :any_skip_relocation, catalina:     "86d5be0980d5622077797759188697dd571f22d59f6506c05016217ad7f729bd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8aa9bf63ef1350c2e0a2881a2c5f8835cb34b4e27b62f0345f83416f390f44b9"
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
