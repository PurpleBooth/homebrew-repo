class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.45.tar.gz"
  sha256 "2e1e7a376af5d1a0fd7a8f9b46aa7eacbdbb3347f7597cf5b500711cdd456668"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.45"
    sha256 cellar: :any_skip_relocation, big_sur:      "df76c829745aef74b933852712ddbb357dc013d2546ead11db2287c84977eb14"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bef832d16d243266f28c5cd3f5cfcc661a6562ce62f9bce8d0856b940c273321"
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
