class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.42.0.tar.gz"
  sha256 "922deb1c466197db069d17b339048f853e746ee8c5379fc4ebbee4605cbc9a77"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "cd9dd1bb1f0d3dbc951808a1388f291838944165f9e0aed3edc3ad2526af7eba" => :catalina
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
