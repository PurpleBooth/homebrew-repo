class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.31.tar.gz"
  sha256 "ef5945e1dad49c96d18f6076d41f9335e69df4f0cd7b9772dcae9bfe12b74c01"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.31"
    sha256 cellar: :any_skip_relocation, big_sur:      "c7f0e659de679733d84bac62c380af6347b58e64968720ce88a312848cfa1bac"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8f663f6e726db9790277606273f2d86545e84462a119ed65b68a540aa38cf4c4"
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
