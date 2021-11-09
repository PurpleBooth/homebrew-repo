class FastConventional < Formula
  desc "Fill in conventional commit messages quickly"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v0.1.1.tar.gz"
  sha256 "d629dd3ca18e9d37ddbfd666be955b879c74f91016559fce0b889fa9328dc96d"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fast-conventional", "-h"
    system "#{bin}/fast-conventional", "-V"
  end
end
