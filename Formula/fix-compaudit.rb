class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.46.67.tar.gz"
  sha256 "4cd6dfe5a19e5e41a0bd73ac23ce407507f8f870e09d9e5f7d24de0bde4835fb"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.67"
    sha256 cellar: :any_skip_relocation, catalina:     "e0dcfbd03d1f739ea852d559a27f9cf9d39ed199fea34f0a94b5e82e55a223df"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ac16d289f85a138deb2a0e5e808d19e38920f23954de10de427ee03730c73a06"
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
