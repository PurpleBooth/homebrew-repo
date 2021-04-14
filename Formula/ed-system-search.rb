class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.12.4.tar.gz"
  sha256 "ab715fc1153ded8a505c6cef13fb5735c0bc57790e9c33b903b28f0ff1c96f89"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.12.4"
    sha256 cellar: :any_skip_relocation, catalina:     "a086162ee32a4cfa9de1298eeb2587563961899a20b0049b5abdcffa8f92d3bd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c055a507b55c47aba0efbe2a636c0efcfd8072f18e0c83fd4b1cb2eda0d7a702"
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
