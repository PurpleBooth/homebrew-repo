class GoodreadsQuotes < Formula
  desc "Get a random quote from random categories in goodreads"
  homepage "https://github.com/PurpleBooth/goodreads-quotes"
  url "https://github.com/PurpleBooth/goodreads-quotes/archive/refs/tags/v0.31.0.tar.gz"
  sha256 "29b4cb5778e09726bdd0a8ae548723b2a132157d90d5b310a479306dbb3ab208"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "765f1874055b7f5e03909356f2be588add43f5f5f53bdea6b92644acac4de63c" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/goodreads-quotes", "-h"
    system "#{bin}/goodreads-quotes", "-V"
  end
end
