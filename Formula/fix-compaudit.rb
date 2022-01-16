class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.46.72.tar.gz"
  sha256 "69453b400f73172735755f7be1edf6750cc33a9846ebc61a6c018fdbc415a1d3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.72"
    sha256 cellar: :any_skip_relocation, big_sur:      "5c97c43e0825ac470ef122dd46f523bcea0c41a511ea04699e3deaa675e79cf1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "be3da446be156263de8cc555b38752b21bb434f939bd336915db476b6109d59d"
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
