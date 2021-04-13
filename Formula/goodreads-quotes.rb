class GoodreadsQuotes < Formula
  desc "Get a random quote from random categories in goodreads"
  homepage "https://github.com/PurpleBooth/goodreads-quotes"
  url "https://github.com/PurpleBooth/goodreads-quotes/archive/refs/tags/v0.86.31.tar.gz"
  sha256 "554c958feaf19793c1cf3e89a3e0a909c74e31f5c15d1b112e0889fdb95ba2be"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/goodreads-quotes-0.86.31"
    sha256 cellar: :any_skip_relocation, catalina:     "9216ffb967d503b5a21a133811085f2875d8fe7d6da3d65537a374f1f0317ad9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "58e134b9bddb3da42373e50150b2148117f55baaf9d75df7a54da16debebd89e"
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
