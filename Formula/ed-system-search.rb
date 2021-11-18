class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.7.tar.gz"
  sha256 "3a98ecf8098da6b377016928db04eea0c8aabffa50102d71bc91efb1b0cff269"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.7"
    sha256 cellar: :any_skip_relocation, catalina:     "a6a4334ae458e2bbe9a237943df1efffc4275861dd09e4f20b8af5029ab0c577"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9073f486217d658e3f6e4a3cb2c63b1e5e77fa25774efadc73ae12643cd34e3f"
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
