class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.21.tar.gz"
  sha256 "2aedaf8e0a3c079f476bd7c2a41abae04d00175509983e3c7a053d003d5c58a2"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.21"
    sha256 cellar: :any_skip_relocation, big_sur:      "feea69f0f036a9efb834b09d9103ef942c54d0be2b19152e08dd532e96be34c4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7848b55d77600eb00c1848e6abc5dd1e886f4a63c7314f3c604475eddf69ea04"
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
