class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.24.tar.gz"
  sha256 "5e55a59fe1bfda0230fe5d9175bec10f31e47d2221a8a8f2d195eb5a1e6fed85"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.24"
    sha256 cellar: :any_skip_relocation, big_sur:      "645782c175654789e0a52fbc6c1eec0e41a0ae895dda1580e8be4ca62f89abb2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5d723a9de2d98a17f9632a2b87be786eb16ae6aaac916a0ce96cb2312f7c7b86"
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
