class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.0.9.tar.gz"
  sha256 "d12f0dd87a76cf64a39d09c0c78d1d9f820c46f4d488725a737ad72d8e700f51"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.9"
    sha256 cellar: :any_skip_relocation, catalina:     "e78407eae0a49e739dea460a965a4b9fbb3fb28ec787a25a40068b317306c372"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "757f90317cc1f2c9b762e46108f3b5445766953f9c235c00b901fbbc0d7060d3"
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
