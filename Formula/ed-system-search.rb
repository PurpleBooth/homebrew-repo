class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.32.tar.gz"
  sha256 "a3b83ad682f5bfbebf955fc20f78a9d357ec7691085ef6c6506ac47fecf289e1"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.32"
    sha256 cellar: :any_skip_relocation, big_sur:      "377e76f970752844890fc4ba09f43a1552b86b2064a371fb119421c22d1ee736"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "146a85a8a0dd287c6e6d3ae68c06ce0a0f107459ce3ca3200f774421cec66b1b"
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
