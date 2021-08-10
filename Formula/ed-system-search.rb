class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.0.13.tar.gz"
  sha256 "8c41f7fa1687fabb3c8c271cb7eae6f7f2226609b19822848a332b746f3eb55d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.13"
    sha256 cellar: :any_skip_relocation, catalina:     "d9c6c6ab4956829dd9ad239dc9d6d34607d8554a3e7dc4e7b342927daceda5fb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "db7a09f057303975f11a0e039624ba8049c1f5a86a356637fae3ebd8389aca38"
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
