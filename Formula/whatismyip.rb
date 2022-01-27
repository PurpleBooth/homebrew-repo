class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.34.tar.gz"
  sha256 "795f2e8fe4c8fec0b08385e2b32ff84b8553484cf7f4e1f55ed87debc02aa183"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.34"
    sha256 cellar: :any_skip_relocation, big_sur:      "aafca07eb7262ec2a97b37aae6f80501b7e3cf55788e7ab0267a55b6495b832d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fe2d2a9da36d9e3f35fb8bc92321c01adf6df4c79c81629a4c573684724527bc"
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
