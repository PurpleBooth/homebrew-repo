class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.46.64.tar.gz"
  sha256 "1a44c39f8da7525a1a351dad345fe04216cf269acaeddc59b1f1822027e4c6e9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.64"
    sha256 cellar: :any_skip_relocation, catalina:     "b8e55c622d31c964431186a910beeddc9eac2b11e125a91fa12a1f09c62af968"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a0fa1744d0bba221d9b50bdf21035d25f0a95899d8a900f39b564940aaae6053"
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
