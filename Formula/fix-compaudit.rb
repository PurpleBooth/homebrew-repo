class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/refs/tags/v0.46.63.tar.gz"
  sha256 "b28466829115f5137778191f1a4e0a91ebc48567d2cb05832818d67cbbda75c2"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.63"
    sha256 cellar: :any_skip_relocation, catalina:     "4494839b0f01720de7906d828c9597709a55615ec1a3ca729d196dd1961d9262"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9714dce4330da585a8ef33168c625e68ec93ad75604f314b2ac425e7e0be7146"
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
