class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.29.tar.gz"
  sha256 "13b61f119944b45b8d5f956eb43755866ad6e8c26bb7b1fbe626dc669caa2725"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.29"
    sha256 cellar: :any_skip_relocation, big_sur:      "dfaa7eb1d2cf69bc647672e3efa8a4adbb5ac09c757a5054c5c411ecf7708b37"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c2aecfef5c6d8937233a954612ba0d9ef220ea7414d3d9731e68a2c2e00ad084"
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
