class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.50.tar.gz"
  sha256 "b31b212b45d98abb94c4607b5633c2b02a1472f34d40c1369b2214746ad1c1a3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.50"
    sha256 cellar: :any_skip_relocation, big_sur:      "60f2d3c6061a400c32adb8c3291ee544a1ad7ac7a81b974a94c74c1c81922536"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3b7797b122dbccd4d33183ff9a9285aba59fb4da4cc282920434fe6170bdded9"
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
