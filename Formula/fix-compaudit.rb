class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.5.0.tar.gz"
  version "0.5.0"
  sha256 "76d32cbc2d1317b2607a7eec92872ca50e740ee99d4468fda2757ccad4d58593"

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
