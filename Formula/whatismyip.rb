class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.13.3.tar.gz"
  sha256 "ad16f6f43d53a95e57cd705927d3d65869a1b5aedcd222a9a28093e4c2d7ebc9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.13.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a69236e6ed6ddb32edcfbc4ba1a1c3f432cff5334bd4aa53e040033a4ebedad4"
    sha256 cellar: :any_skip_relocation, ventura:      "7d6aebef017b0ceaf799f87509e6db89d9b44cf1f346a367781d3fca25d73240"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f72dcf9c7fb37825e29b897221dfb7b2921b2d6fab258a90077b0160306d57ca"
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
