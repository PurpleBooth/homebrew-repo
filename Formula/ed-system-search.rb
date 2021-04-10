class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "28a4b6ba08cee8120a2590f392909eeb26d9d71482ad47635143f877cf3e27ee"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.2.0"
    sha256 cellar: :any_skip_relocation, catalina:     "01d3b3eb935fd127dc6f7ada7bf04f082e7f32c7840baf8111b30d6325dbd7f2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "00ab69e90e18e6e6e13bf5788ef6cef02660ab02b42ae5feaeb461ee65968a07"
  end

  depends_on "rust" => :build
  depends_on "zsh"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ed-system-search", "-h"
    system "#{bin}/ed-system-search", "-V"
  end
end
