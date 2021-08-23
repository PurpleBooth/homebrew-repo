class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.0.15.tar.gz"
  sha256 "b2173034ef476d9ca40fcf87478404d0b0c6e7a4c0018c884f1d3f733c1afd3c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.15"
    sha256 cellar: :any_skip_relocation, catalina:     "94dabe420619288b4568289b2192af58b7cdfa2dd53071cd5a1d081670522282"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fdf87d84785e65b5e5e4c588f8b8340aa012ff5975279391f39814c9e8af9f01"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ed-system-search", "-h"
    system "#{bin}/ed-system-search", "-V"
  end
end
