class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.18.tar.gz"
  sha256 "a24eda645e330d887eed7e208d23de10f2c2c40cf8cbbcaabb6984554dcf3c53"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.18"
    sha256 cellar: :any_skip_relocation, big_sur:      "6654ae6c639d0f8583473c50351cd80d2c2a040534d949f9cc01adf9484c9350"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "071f0e55db0827031fdd04cdfd99f043595de38303e5d1a12787efac1d9ad663"
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
