class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.8.1.tar.gz"
  sha256 "6ae15f2b6c02fd315fa057f7b9430074593818b793b3c3482a899487ef9e0206"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.8.1"
    sha256 cellar: :any_skip_relocation, catalina:     "e21391ee9f47c3cbccd0554957656228091d05933a96c90ee91a969418b5d81b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5ecb1a9ce7b312696603d6683b752069df07f4ebae0d0cb057ab3b414b81e320"
  end

  depends_on "rust" => :build
  depends_on "zsh"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ed-system-search", "-h"
    system "#{bin}/ed-system-search", "-V"
  end
end
