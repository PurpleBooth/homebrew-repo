class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.3.1.tar.gz"
  version "0.3.1"
  sha256 "0faffdec101ad5cf7569138722f949ee6d68b491e93c40bed7539e86d1aa157a"

  depends_on "rust" => :build
  depends_on "zsh"

  def install
        ENV['VERSION'] = version
        system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fix-compaudit"
  end
end
