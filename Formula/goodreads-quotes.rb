class GoodreadsQuotes < Formula
  desc "Get a random quote from random categories in goodreads"
  homepage "https://github.com/PurpleBooth/goodreads-quotes"
  url "https://github.com/PurpleBooth/goodreads-quotes/archive/refs/tags/v0.55.0.tar.gz"
  sha256 "e8b2e0b901dd48944bd5f8f60216365c32952b5b0fa6d71ec6b35ccab1056b63"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "e308c2ee9548c39b9e6d681498080afe98fa19f33ea31983413b29534895bb31" => :catalina
  end

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "7794fd05ba9fa2f31aa7f72dc2a67dd3cdd074dd0add11440e6496108be4f696" => :catalina
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
