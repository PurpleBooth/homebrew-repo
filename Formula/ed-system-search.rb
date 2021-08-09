class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.0.12.tar.gz"
  sha256 "96a314442dac7becf26aab62e709eb39697685681ca7f39a462accb179437d8e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.12"
    sha256 cellar: :any_skip_relocation, catalina:     "a756409978b7ba7b3227bb9a3c679763fee9ffd57ae8415f48a9c92d897fa660"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "82486827e532bf6edca98025011ca14c5ccafd4364d8cafc65bcdb13a3d88e43"
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
