class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.46.58.tar.gz"
  sha256 "649c0036e523010fb27a187f479895db1e44f4a6af01aae9ce4ab70677279015"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.58"
    sha256 cellar: :any_skip_relocation, catalina:     "555e3260ecbceaee2d90e49ffc27b8087a9378aaf07273c02dc5eb63d83dc6a9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b049d225e3a9f5e9aec73ef9138508a3b62e53637aec3c36491b530056158566"
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
