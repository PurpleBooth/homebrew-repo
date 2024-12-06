class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.13.11.tar.gz"
  sha256 "c749b8260160629c51af572d8ffbaa054302124b2f23ae59260016e5d51c89c9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.13.11"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b68a22d5b6a177d1bd7b7736b2133d1d06343664371d97057090eac39c8731a2"
    sha256 cellar: :any_skip_relocation, ventura:       "d8347acb690345f506512b6a11f1165c9945f3d9d15014bd51b25947ab18dbe2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "95497f4e95da76c7b26f31fd52e1677be83282bf3d92236b7e861953238d6d07"
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
