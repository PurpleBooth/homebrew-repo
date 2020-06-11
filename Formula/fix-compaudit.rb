class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.27.0.tar.gz"
  sha256 "13f6b4cb47527b05e425c1a0db4b84f2dd1e76bf5ff48fc9fc7853c35e8bc7f1"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "d4e6142057cc24368bf0610800f6e4998bb1e4f816309c3a00a2cfcc6daaf003" => :catalina
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
