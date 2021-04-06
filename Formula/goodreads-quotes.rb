class GoodreadsQuotes < Formula
  desc "Get a random quote from random categories in goodreads"
  homepage "https://github.com/PurpleBooth/goodreads-quotes"
  url "https://github.com/PurpleBooth/goodreads-quotes/archive/refs/tags/v0.86.30.tar.gz"
  sha256 "96257205c5078af9862aa12b2ec73905a2910aaf97ccc68e7ea20587621f3007"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/goodreads-quotes-0.86.30"
    sha256 cellar: :any_skip_relocation, catalina:     "6f5c5cc755fa10f4d0d69f818a31122988235a53ecf7c8246708ef6ff4a3d395"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c4bb7281dd9a6ff7a2402dd5dc04c0f8c63d0d3ac0eeec1a2678d319d792e1d2"
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
