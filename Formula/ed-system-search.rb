class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.0.8.tar.gz"
  sha256 "19bcd2083b1faa6402321458ab056bad0e4c368817a2638e5638e893a3d6fdcc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.8"
    sha256 cellar: :any_skip_relocation, catalina:     "cff5050243920cadb25d7f7c3af6eae84dbe24bb351309cdeb9578f804a66f70"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d7db7995aeb3e6d481f4a1b5d2df0982905b7fa4370409cc5f9a557431efd105"
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
