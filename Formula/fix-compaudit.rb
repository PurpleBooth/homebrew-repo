class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.2.0.tar.gz"
  version "0.2.0"
  sha256 "10d138f06eb66de20f8301b928dd3955e6e16716161122eaeb6df2c9b3c7651f"

  depends_on "rust" => :build
  depends_on "zsh"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fix-compaudit"
  end
end
