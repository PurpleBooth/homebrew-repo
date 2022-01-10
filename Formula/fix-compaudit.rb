class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.46.70.tar.gz"
  sha256 "9d777fd2b2f266f5058be4a5b81af61ecc8945cf5ee6137e7e50e66cb0c50c89"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.70"
    sha256 cellar: :any_skip_relocation, big_sur:      "abe1996120b8624b5363c8d997fa47602792daa4bffe3fdb07fd6a9abe065d2d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "cd899ea2652b64daa17af3370d2e4383c1bcf857494721be23c490fbb208aec8"
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
