class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.13.1.tar.gz"
  sha256 "f53dd9613091e0dca2043fc7088b4b20b12867e758dbc682b018285961d0ca75"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.13.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6e2048c9ef65c234df62e73942585078b72967a628bf3ad7eee1fd2bf9ad58b5"
    sha256 cellar: :any_skip_relocation, ventura:      "89396c138d929d7e972e3a3753f515206d30fc20d8024f09e9ae49425274988a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d44e1fffa89c33785756a02396658ca73ead48cd6977882d453ebf71bb8bb6df"
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
