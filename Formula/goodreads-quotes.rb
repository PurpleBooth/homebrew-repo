class GoodreadsQuotes < Formula
  desc "Get a random quote from random categories in goodreads"
  homepage "https://github.com/PurpleBooth/goodreads-quotes"
  url "https://github.com/PurpleBooth/goodreads-quotes/archive/refs/tags/v0.19.0.tar.gz"
  sha256 "8b88c252508b70401a8a4b39d4444f7269be78ab3e855c633b914a90606bb1d6"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "15f3e1acb14cf3e357bb588661788cf37314c67ce7f082ea5d4f3f3255b029ac" => :catalina
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
