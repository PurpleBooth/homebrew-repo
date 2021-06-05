class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.46.66.tar.gz"
  sha256 "1a4f14878fb02404f2070d7fb73d69f335677667a05f7361c808d96579bb3a88"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.66"
    sha256 cellar: :any_skip_relocation, catalina:     "71d86e8db97e27d183b3a35b16fad7a33cfc1aa3e3f937a09f5a98c9a9fbe061"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ff1ef6205e9b8d34982004ae9bf15a8644d32701035755840592c7c4a20231c4"
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
