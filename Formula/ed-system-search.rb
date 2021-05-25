class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "126184824fef467b6b59e614a962abed9c7d6545d2d801bf374cd77ebab53c7f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.5"
    sha256 cellar: :any_skip_relocation, catalina:     "c46d359febc720d5143fbd4e3a610d1a66bd13357cbb521b20eb315934e53f63"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1fc2bc8ac74cbe945b6600b35c73a3a73f7d77d24a7476fe876d0fd87fbf6b9d"
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
