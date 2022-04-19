class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.39.tar.gz"
  sha256 "59f8d8c3264b48c8525767ac41765dcea27f75535bf4fc18c3a9d65c6fbe51e6"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.39"
    sha256 cellar: :any_skip_relocation, big_sur:      "e87ef932370dfd7034d250e669cd643a6fdda17fab250682391ab1ac581776b8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a150625ab20044bd08dcf15656dee4cc06747aeb478b155f4f35b4e72b0d1c5b"
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
