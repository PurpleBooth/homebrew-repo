class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.51.tar.gz"
  sha256 "4c24f775cc45efd61866d49a61944bc25508ba88f33a574a9f90ab88d944b77b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.51"
    sha256 cellar: :any_skip_relocation, big_sur:      "ab154346198c7429d60ce4ca6dd26d2ef759ba7fedfa456be9bd8f61b03987d2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "69aa302d6bfe3c0436608341379256a92edb18cd887f1b6a3d88a28f96a2abc8"
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
