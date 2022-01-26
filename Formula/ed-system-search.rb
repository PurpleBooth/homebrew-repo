class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.23.tar.gz"
  sha256 "d3b2da1a2994736b8b7286d74a269183d425aca1517ea97c029facae9560322f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.23"
    sha256 cellar: :any_skip_relocation, big_sur:      "bf69b8295c458a9aa216d9bf8c28c96cb14eae1ffc726b1327422f60356854bf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8b1e10c53db903546ec66057a009c024186b2067008ebfa7710b98683fbf4e35"
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
