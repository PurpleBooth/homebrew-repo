class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.32.tar.gz"
  sha256 "1732a9778df3c95f94440b625903161b17f2d9b0dc4beb06e374b77a4a829398"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.32"
    sha256 cellar: :any_skip_relocation, big_sur:      "313280f0f8f35b6bc67ebb0367eac2a6d911060962680ff93e51d02445a56436"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7ed6040e2dd30531f07cfb70ce785391d956a281494474dd3007ba7e5819a6f3"
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
