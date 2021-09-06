class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.15.tar.gz"
  sha256 "be2f4490039b27c5c3f6aaef2185df30e427625ab586b2c980941ff2158c0bd5"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.15"
    sha256 cellar: :any_skip_relocation, catalina:     "be8e70309cf103d4a08e27917f6ed4c0760947b5bfc058e825905dc1d1ad9b8a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "423ee25f311e5fe73bcfe3b0ebf1a20605576c6df2bb33c6e2cafee96d17e920"
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
