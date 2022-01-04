class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.14.tar.gz"
  sha256 "96b1041ae8e40ad5c3fcd9fbbcd345d6e6be914fa1afc6da687d2d90029b74c0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.14"
    sha256 cellar: :any_skip_relocation, big_sur:      "1edffa8521f3f0d6f52b2f4fe96bbd4ef37646101e2727a0118ebf88c82e0a89"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c8704e0f5eebaea7ada4328905c7e45272319d1ff27adddecc5f8255a4598a36"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ed-system-search", "-h"
    system "#{bin}/ed-system-search", "-V"
  end
end
