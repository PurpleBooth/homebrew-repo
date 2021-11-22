class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.21.tar.gz"
  sha256 "f1c8565f77055ede4209a0949be0c67f80fc22b381e7c50df104057d2c4a1a42"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.21"
    sha256 cellar: :any_skip_relocation, catalina:     "f6673329606e23429d333fa7310b53d586f4c2e23b6ac51e16273ec1f2328cb9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ffce25950a97b242e1b04ed9c1892d6149f3a8ce4d618e52cb5a5e9307bda170"
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
