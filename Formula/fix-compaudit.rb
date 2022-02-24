class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.46.75.tar.gz"
  sha256 "8d4dda20a39b97eac0e7a8a8ecc3a93f2bcceced98b58d64bf3d0470fe31c94b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.75"
    sha256 cellar: :any_skip_relocation, big_sur:      "ae117dfeacc3762d70c2a90746fa222791b25ea235391a401fba67a17faf587e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1868f48d47bc6c6e9d641d7be90e3e9afa2cda2b35a1bfd3253937afbbfaac89"
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
