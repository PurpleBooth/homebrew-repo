class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.10.1.tar.gz"
  sha256 "7ee637c64eb00b571460c3c832d6b69f3d307fc65838eac7febe90beb1c3c749"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.10.1"
    sha256 cellar: :any_skip_relocation, catalina:     "f479e3e9d97cec51b28a2ada00416f828e6c0f3a04b1e309b8e49e1559389ed9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a1f3eed4cca9c7047ce6303d133b43ef16eb4e29ce432b829f8b3fda781d35d4"
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
