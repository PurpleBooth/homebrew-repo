class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.6.0.tar.gz"
  version "0.6.0"
  sha256 "5166250259aca62c784cc139d11a2057dfa575b2758038f5c4c58df46530fa89"

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
