class GoodreadsQuotes < Formula
  desc "Get a random quote from random categories in goodreads"
  homepage "https://github.com/PurpleBooth/goodreads-quotes"
  url "https://github.com/PurpleBooth/goodreads-quotes/archive/refs/tags/v0.86.28.tar.gz"
  sha256 "a211cbdaf09bd8a90670b38fae13ae0ad7c249d5e1d45bd77a47c8d00ea9124c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/goodreads-quotes-0.86.28"
    sha256 cellar: :any_skip_relocation, catalina:     "b74505e032e655df77c6c1f84fc633f5966f6fc66d3b85a6659b5aa85b782c24"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bdd491a5c169ee3ad2f7f9663441a59169c20ae3cb9d3b0dbc9cefb7542d8aee"
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
