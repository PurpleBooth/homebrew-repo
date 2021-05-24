class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.46.65.tar.gz"
  sha256 "7a399e16fe563adfc91bff6f18ce1d26602ea8e363e013d243dac6ffed74f84a"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.65"
    sha256 cellar: :any_skip_relocation, catalina:     "e29d8b3f10d79ff01fc4a891ae5e6936c0b3cedfbefc6c99f21baa48872f93e9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dcab9f62a7d3cc490c395f9f3440572c44bae843b3d0e69587dbe0ba36d842b1"
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
