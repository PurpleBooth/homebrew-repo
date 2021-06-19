class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.0.tar.gz"
  sha256 "1af45fec9121bebec577c2198e98bd7549c32a7d9bca0c1ee1a0b2ee39f0568b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.0"
    sha256 cellar: :any_skip_relocation, catalina:     "d63180e61f5565683afe0e9f987efd9a3f9b42141232aa047f1d80ac4c5231d5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ce24500534c8b4a201c2720cf30eab5acbdac6559b3f405c80d9f829ab722ba9"
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
