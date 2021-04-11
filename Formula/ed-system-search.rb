class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.11.1.tar.gz"
  sha256 "394d41db7a248b13a8f1205f45bc415142121cb3805626e3b7f9300da061ee15"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.11.1"
    sha256 cellar: :any_skip_relocation, catalina:     "987b4485ac2d535057bce45e61362c888e6b46e8ba83364f7e7ffea295a63673"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bf932c1ff3188d4fad1cc88fea9af37fac968d3c17eb104fe61494ed992659a0"
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
