class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.46.71.tar.gz"
  sha256 "d071d3e01c2c724ffe499be0ec663255112856dd820e1cdff9068d2bcea73d61"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.71"
    sha256 cellar: :any_skip_relocation, big_sur:      "f5ecf229e7d0d32323e7c62d47b497ab9984349abff63edac97d3073435e11e1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e696e9a6ebb2bc70adef585ba3024c8c7b087598e29f6a6bba30b872e23b9a4c"
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
