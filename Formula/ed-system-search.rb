class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.30.tar.gz"
  sha256 "0518dd6fa9a1d77a3849a833140d9ec3466787a3e841ba940672ddda856ba397"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.30"
    sha256 cellar: :any_skip_relocation, big_sur:      "f86c80f66d948506b7d8b66d3709380c4d3a2f1bb80689d9ede4f4eef56bc7c8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d0bd4768d7f07736fd46d268a70505ec443720fad32f5f2c7da8b1faf1662ed5"
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
