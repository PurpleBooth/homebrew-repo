class GoodreadsQuotes < Formula
  desc "Get a random quote from random categories in goodreads"
  homepage "https://github.com/PurpleBooth/goodreads-quotes"
  url "https://github.com/PurpleBooth/goodreads-quotes/archive/refs/tags/v0.86.26.tar.gz"
  sha256 "60d64cbe5a665ee77b8f2b07d7e7e0f168d5ef582ca6336be5c32a0fd018068f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/goodreads-quotes-0.86.26"
    sha256 cellar: :any_skip_relocation, catalina:     "a038ad480754b69ef97496ae860ce2597e70a1cb1938d06bb93b1b62e2e8456d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1d70c4be7eae97a40d5ad27721b108fc72493b953a8ac62971adff7f4bb9aa03"
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
