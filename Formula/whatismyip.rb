class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.4.tar.gz"
  sha256 "cce05708d45462fc7e5f81603457bbed006c4ac569e4afd99250adbc482f6e14"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.4"
    sha256 cellar: :any_skip_relocation, catalina:     "4917baf7fd8a15f0aa5dc072d143c7f6ec24606e3d0f1a03c30cdd82fcb47f46"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b0a081e8681e9c04ee5ada2de2d0aa2bc91f3f1ff2f376732a9664ae80c119f4"
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
