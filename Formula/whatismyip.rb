class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.35.tar.gz"
  sha256 "6a12a9b8fa6cabedce0b83f6e66f9a5e2a0d29c316c605210f6d683c8d04e11a"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.35"
    sha256 cellar: :any_skip_relocation, big_sur:      "a670061003fdd95085e9b886dc19a516e44b48fe7b7b03ca23f78aa0d3504b7e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0913b43cf5d8e5548152d425d1745d41e3501299ce4066eda5acb78043010358"
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
