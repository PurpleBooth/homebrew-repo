class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "ae3cfa77ad1bf861a48eea114aa040219b9e3d2f3d4951cbce470daceadb9a65"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.6.0"
    sha256 cellar: :any_skip_relocation, catalina:     "ca0186f823303800ce65f85a9467860a9237f095ae111544087ae325157f12f1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0dfcb0b10b90547486331ea17f99f39d0811d1b875ebe01d34d6f3061981b804"
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
