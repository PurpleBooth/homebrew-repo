class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.36.tar.gz"
  sha256 "933c896cd27bbcc106cca43abdce0f104db2caebe8ce21bcf22b101d8cebaa46"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.36"
    sha256 cellar: :any_skip_relocation, big_sur:      "bd7aac8b984be9025d5f337318c5da1d8fcb8c630a06b2e9562df84f39e8fda7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dbc32586cafbdafa28568e1af914903781f37f4e68daf68b36934c18e642ec12"
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
