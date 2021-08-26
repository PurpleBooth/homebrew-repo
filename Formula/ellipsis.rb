class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.13.tar.gz"
  sha256 "9bd72202df2ebd096e5286a1308e1b1d760d86ee29eed097c9f84c4a35287566"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.13"
    sha256 cellar: :any_skip_relocation, catalina:     "125d59d83e9cffaa2069f58dbb0ef0124be038d322093cea997f832ca5987f3a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "548c3fc0afea6d96e5c26de2329ed2e7450171b7d09b30085d03ec9742d33c7e"
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
