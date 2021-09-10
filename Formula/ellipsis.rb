class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.16.tar.gz"
  sha256 "86a4c914c233678517539b249d0806c6897358c7dced921713c166b855e85884"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.16"
    sha256 cellar: :any_skip_relocation, catalina:     "3adbb629c26b1b76fdb42889d9f156a0d1b5989e0b5f2a8907239a02be8b09a8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9ba48c22c58f25dcf1025311270e533abf02a2d8d1d5ad7bb2379d9e778e5837"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ellipsis", "-h"
    system "#{bin}/ellipsis", "-V"
  end
end
