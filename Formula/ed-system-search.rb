class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.11.0.tar.gz"
  sha256 "197662cff6d388c03c2b17462efc0d0cbe53dd9680ba39db2fcd79f5d65b2407"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.11.0"
    sha256 cellar: :any_skip_relocation, catalina:     "082fa190ecff8e285fcdf5b53a3dc8a77d13a5e1fc236ad52b0dde2c5f23a0bf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "07e0f56ca8a6da513728e532fbc8e89373b35a1685c2ca18d1616584ad465bbf"
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
