class FastConventional < Formula
  desc "Fill in conventional commit messages quickly"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v0.1.1.tar.gz"
  sha256 "d629dd3ca18e9d37ddbfd666be955b879c74f91016559fce0b889fa9328dc96d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-0.1.1"
    sha256 cellar: :any_skip_relocation, catalina:     "3ab90d57bc6797211891032e14bdf6d22713484dc067a15526b2aec1c8a17ad6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a598598e1093018bd30f9637428fc061f002a9998014a8d88302ab069c08b43a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fast-conventional", "-h"
    system "#{bin}/fast-conventional", "-V"
  end
end
