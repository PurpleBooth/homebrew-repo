class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.9.tar.gz"
  sha256 "234fe08f34bacc4b81c0e30aac4f813b767124f06efb8270c9d55d0aef624d34"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.9"
    sha256 cellar: :any_skip_relocation, catalina:     "9ebcae7185bc821ba3aa0c1bd2a43f0f8a6867512bc1cd993f17a7f6609a0a11"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ba22317218dace0f929e47a67a6fbfb194573c32d851b0335151cfb88b6a1fda"
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
