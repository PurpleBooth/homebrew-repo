class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.8.1.tar.gz"
  sha256 "4f84a728eecf1c728e137b8c2b8a3b37d5fafedd64e24c51c1c49137456f5003"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.8.1"
    sha256 cellar: :any_skip_relocation, catalina:     "f56aeb96d43feacf7eb9eb4d951547cbbf44ce328aa31654629b1d352a792ead"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c9949e4180667e62fd0760243875e657a29e3b12345d13c9fd00738d22d0c6c2"
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
