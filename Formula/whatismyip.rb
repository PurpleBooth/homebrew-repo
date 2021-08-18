class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.10.tar.gz"
  sha256 "16620fdb4676c742f4153a0eadcc651b3ce579b5d33c7328e0c6bae82fa7a2c6"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.10"
    sha256 cellar: :any_skip_relocation, catalina:     "646d3137c5da6cd575d1cfd4838c65a0f07220665de0ff13f10e11d264f3d6e3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e4eed9ae529e6b45bd576d98adb0b67bb417cdf4ef4abf548ee46fa3a48915dc"
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
