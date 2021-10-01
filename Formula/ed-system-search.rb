class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.0.21.tar.gz"
  sha256 "f92e3216dbe3fce4bcdb10dcd0cf3f3c913ff5f6f542efcb439d84ca2ff1e0f4"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.21"
    sha256 cellar: :any_skip_relocation, catalina:     "ad35aaebc246ea5b28c9fab3332f69e010d17921fa25ac4b60aa4a1b9bb627d0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b9a2559563f4b1d943225a3fbcccec0276f7ca1155acf7b890227df7338c3392"
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
