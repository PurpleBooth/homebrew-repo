class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.31.tar.gz"
  sha256 "5750c3a9862a7ed846e38dcba8be44a15df45725951b1a903aabcbce3698c07e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.31"
    sha256 cellar: :any_skip_relocation, big_sur:      "aab3d678d2d952917e78c4ae12a5111c666c0a785e91955538a21bbcc516c079"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d02c7f90c696734e88c7ca27377066e0623e80c4db804ccbf660d24ecef74fa2"
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
