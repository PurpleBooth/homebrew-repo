class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "4f909274f07d33a3734ad6c185e987d589d8bb137986f8ae9b6f9ed6216a4c4c"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fix-compaudit"
  end
end
