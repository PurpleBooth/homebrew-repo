class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.41.tar.gz"
  sha256 "28ba3b16f3b18a1965cc6c6aded38601498f489e041cdf150e9881a39b864dc8"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.41"
    sha256 cellar: :any_skip_relocation, big_sur:      "00daa54d32c5335d4c79697e1aa96e5d3aee344384176f03d1c6d00938dad9f3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a1523e221eeade37f5c6fc0670da1238c6a00fdf5a41b626da302080d14b9ecc"
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
