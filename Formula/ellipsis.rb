class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.23.tar.gz"
  sha256 "9f7bbfa0f239f33a6cb8433ed1ea0b839ee65e97fd19d3a3b66bc019fb470141"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.23"
    sha256 cellar: :any_skip_relocation, catalina:     "5efc23d49a188636118ed1070ac20c1ea2739a91d345e0cc824ae6aa81af4260"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "33de3ad1e1547ce4e5dd7c71c01813ae5997e7a3aa9a59b7459f07d4722f5819"
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
