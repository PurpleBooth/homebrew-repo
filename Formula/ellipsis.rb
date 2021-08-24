class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.12.tar.gz"
  sha256 "65df16cb370b4fd45ab0529ffe8fe4ebd21a2295c3092688dc2e2a2cfbfbd6ad"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.12"
    sha256 cellar: :any_skip_relocation, catalina:     "78355d0e561ad0c1bb1ce8dacc350802d728c9daa75428bbf389c4054d0c01d1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "089a557641e8274d462e4a916388ea931d07f298637e29de7469e35404368d23"
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
