class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.16.tar.gz"
  sha256 "20ff69922f71dd3492f6dac036a258793f8ccf1f5066fb8f31467727aa414db6"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.16"
    sha256 cellar: :any_skip_relocation, big_sur:      "ceebc07744f52fc9c4e68a4441d84786e9beb0a63f92dfdb71512fe280a7bc4e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "568cb05ee36cad5160f3fd9ca60cfb634e70268115df6d5dc8884c02a08fcb13"
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
