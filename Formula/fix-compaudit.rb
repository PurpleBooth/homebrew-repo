class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.1.9.tar.gz"
  version "0.1.9"
  sha256 "aa0572ece54904bed768e624d625a8922ce9b0f8a7e1aa574fa1f899b5fd7732"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fix-compaudit"
  end
end
