class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.12.tar.gz"
  sha256 "32121ea64fefe23edcfa4a195872dd45e3a8743e6d18cb7f65ceff6025ab49d2"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.12"
    sha256 cellar: :any_skip_relocation, catalina:     "536469f2aa691c7e4bb85a89bffe66340c9051b33a2ae00e056b3d56bb1d5ded"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d3d9aaeb3caccd1ed23f5641e9397efdd5d0afcb0585ba3b8cc410d5f85931cc"
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
