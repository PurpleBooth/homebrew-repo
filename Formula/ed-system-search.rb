class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.38.tar.gz"
  sha256 "f4c12c254f1613bada60787f1f0852e7e9912a1859c7895cec9ae6466268d3e8"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.38"
    sha256 cellar: :any_skip_relocation, big_sur:      "b7bfbe3431d54dd4e21a55edc9650c747d10ba04fcc5aa45feb71ecc2a689861"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fa458a9bc2ec567728b06dc6fa2be3b3f2bd2cd8e22ff72a8f539ccb4c6141ed"
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
