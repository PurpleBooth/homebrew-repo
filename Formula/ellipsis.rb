class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.24.tar.gz"
  sha256 "f340a3003cba739065889795b6e96995aed72e6e4a09ce3b0d396e54cb607ff8"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.24"
    sha256 cellar: :any_skip_relocation, big_sur:      "3d72329a14e96965b2f3ca3efd878a32119890214938c60022806942061f0db7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "99a2a7b9748bbda4db306577abf49a60e3047dccffd2eefef3a042f962004fb2"
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
