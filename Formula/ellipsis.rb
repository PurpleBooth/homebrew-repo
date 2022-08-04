class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.56.tar.gz"
  sha256 "4493c9ad825f1f9f941189c294776f22c7023e642d062a6eb442841d842e16e1"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.56"
    sha256 cellar: :any_skip_relocation, big_sur:      "0f06cf2eb01d21df11fcf3f2eb0c0622df8e7d6e778be877981c13091de1588c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "161d5c62d9a4487ba865ff5972fd75b839e2bb3d15110f243451a0ce9e32f738"
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
