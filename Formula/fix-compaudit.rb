class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.3.2.tar.gz"
  version "0.3.2"
  sha256 "c3971e6520e3bbda868be2f2d2cd8f45925dc16cec8d0eceec2dfd95eb454bca"

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
