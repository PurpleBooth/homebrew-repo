class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "aa9a68b92085a7ba7b452fbcfbe792d7f19995ccf6e5c56de9431141ba7c1e42"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.5.0"
    sha256 cellar: :any_skip_relocation, catalina:     "8c6e806ba7acb440303b751fcc3420e49dd9459e34d06df8dccee3a0a4138fcb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6e252af968cff8bb2cc10f94322a4a4bf98cf04fe29cac7c9b53ee8c69bb4536"
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
