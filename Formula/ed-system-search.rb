class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "b7754f2593eb4d52a6e6a3f9f76d3a48d992260d78b2b706e224f13a8ccc9c8f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.1"
    sha256 cellar: :any_skip_relocation, catalina:     "b6fec10c954ffd7b54b29d00596f65b7eb309ad1176c886321a6fc2b5118679f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "431b5e6beac27b9a64b098c283040228ba297d40c3f2377ccb15ed73dd8671e5"
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
