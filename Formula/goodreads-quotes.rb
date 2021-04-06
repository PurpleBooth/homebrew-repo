class GoodreadsQuotes < Formula
  desc "Get a random quote from random categories in goodreads"
  homepage "https://github.com/PurpleBooth/goodreads-quotes"
  url "https://github.com/PurpleBooth/goodreads-quotes/archive/refs/tags/v0.86.29.tar.gz"
  sha256 "ec79d0060157249fa8779f665aa51227057d141285d86c5175b549951d4474cb"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/goodreads-quotes-0.86.29"
    sha256 cellar: :any_skip_relocation, catalina:     "9918a575af37524b777a55974e63daf4d367d647333b5b663babb7357ff86f8b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1e0b77213f860219ff52c3e5c6708e50b38a406d60826255daf41744041111c1"
  end

  depends_on "rust" => :build
  on_linux do
    depends_on "openssl@1.1"
  end

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/goodreads-quotes", "-h"
    system "#{bin}/goodreads-quotes", "-V"
  end
end
