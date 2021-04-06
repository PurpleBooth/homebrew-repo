class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.46.62.tar.gz"
  sha256 "7fc3e5403dd4b6d25e18d2fb53a04b3a70407f7f6e757e76ae2d20501dd3b391"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.62"
    sha256 cellar: :any_skip_relocation, catalina:     "65ae3cf90b360384bb234aadc5bfd31a0e9bdee95e364c5e9dbe8fcebdbc75c0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b09cc655b96e7f7c7844a279a734ae9662d1df68a9bae4781e7117ed2f9c601a"
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
