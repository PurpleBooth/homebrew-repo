class GoodreadsQuotes < Formula
  desc "Get a random quote from random categories in goodreads"
  homepage "https://github.com/PurpleBooth/goodreads-quotes"
  url "https://github.com/PurpleBooth/goodreads-quotes/archive/refs/tags/v0.40.0.tar.gz"
  sha256 "81f94ceda7939e3f1cdedd096b52d8d797805810b22311f78043a2e8c026732a"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "f1ae450c72fd874ef5ffbe2055b802e4519c58aa5a67c68ac91c99a5044471c5" => :catalina
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
