class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.19.tar.gz"
  sha256 "a858f757dab402ca9e6e979a2f5ed7ccd728d1b14e7ad10f957c04789622d7bd"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.19"
    sha256 cellar: :any_skip_relocation, catalina:     "906799cc2122d9ba365fbe0c85e1cc34ca8d2795f27edb561b3cc82b06396b52"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "66ff7bb4c14ce9f224833e88bf88aa5e8c217c8966452f34dbc5362d9424573c"
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
