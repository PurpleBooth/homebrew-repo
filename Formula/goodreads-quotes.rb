class GoodreadsQuotes < Formula
  desc "Get a random quote from random categories in goodreads"
  homepage "https://github.com/PurpleBooth/goodreads-quotes"
  url "https://github.com/PurpleBooth/goodreads-quotes/archive/refs/tags/v0.86.1.tar.gz"
  sha256 "ee802f0d0430d92df2d3d8e3a7e42d59e91b59af92db19d6c8711fd673ffe7f5"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "01b2030817e1e160ade2f64edb5e8323cc3a4bf84826d5693293f9b3eb8c02ae" => :catalina
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
