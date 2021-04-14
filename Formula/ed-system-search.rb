class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.12.3.tar.gz"
  sha256 "82ff4bb6247d5e0d2206da23b996afd3de4c2f82022e3e7a209a4cdd9d4a445b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.12.3"
    sha256 cellar: :any_skip_relocation, catalina:     "8d32fb2faed0811f8f134b25b738b7419e9c762817308c472493df0c35c73aea"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "849b52e4f6e54c62b165e841d35a3f2b389b4357b5d22f2be39bdb95a0faf86a"
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
