class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.8.tar.gz"
  sha256 "0b9b1ce531acdc25dfd72415cbb60cc1c7bdb33ea9b27c1027e3b911b288d1d3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.8"
    sha256 cellar: :any_skip_relocation, catalina:     "efcea8515c2496e5b911a02beec0411889d94eb69fd37498e0285939564ff146"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "81a46b0771ec08fff37f788eddc684027b798a61eced62dbd2d41b752162564e"
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
