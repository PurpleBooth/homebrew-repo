class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.46.55.tar.gz"
  sha256 "77d4014389566f1a02bfb9f3c85e285ed2c4e35785e986cabf896394c15b1957"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.55"
    sha256 cellar: :any_skip_relocation, catalina:     "2b3d0e98696cf8e2ed4da66cac11a235d921dd9637fd2c6887843ac34a729408"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8845734c8fb3d5c47d2adf747ae9c761b795eb6143d3bc2f04097342278bc9ea"
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
