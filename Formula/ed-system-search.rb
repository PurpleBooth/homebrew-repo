class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.11.5.tar.gz"
  sha256 "1bea59cb80a97c6e97e6df4ec75e4eae1c9aef0cbce4f08c3a60a3598828782d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.11.5"
    sha256 cellar: :any_skip_relocation, catalina:     "8fe7b08e075ffec1b02e15d6f6297d12da71f06db1c28f26eb4de8a96d2831df"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7f75520e915050aa52b484367effd78baac0cff9a6d828c9fead0e27c2503cd9"
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
