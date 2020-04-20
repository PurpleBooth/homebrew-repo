class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.4.0.tar.gz"
  version "0.4.0"
  sha256 "8dee0d047ba39d346e43fccf92841509a4f4299d06b5585a3726730690812a2e"

  depends_on "rust" => :build
  depends_on "zsh"

  def install
        ENV['VERSION'] = version
        system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fix-compaudit", "-h"
    system "#{bin}/fix-compaudit", "-V"
  end
end
