class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.28.tar.gz"
  sha256 "86d9e02977ed9c92aa7b0c60a66484337fc38948a0ee559b3cc7ef8116f9df39"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.28"
    sha256 cellar: :any_skip_relocation, big_sur:      "b2bf4d1a5ed9a5e27619371e032546d55349d5e2590c2a650627e25df297cab7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "322ffbb4cb7e4e2244bfa3f40b9ff85e88d7c3e449bc38c22d135aabc2039821"
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
