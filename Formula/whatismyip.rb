class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.14.tar.gz"
  sha256 "c77778e42a07a5327ec24b8c07e88553d2963bdeb5488c095431d0fcd99a6ee4"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.14"
    sha256 cellar: :any_skip_relocation, catalina:     "5130f4741516fbbf5cfd5a1436ed6bde703feebf8c49003f0840248529c938d8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d6a8f9ac3a0bbb6cb3f7676e9c74fe4d12446fa19c350e6b8fe882a8237f96f9"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/whatismyip", "-h"
    system "#{bin}/whatismyip", "-V"
  end
end
