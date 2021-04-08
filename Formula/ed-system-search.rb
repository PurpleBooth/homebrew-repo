class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "f61969d61a294fad8f1023c3dda7d9ebf2e518b77b9c2a6af65f31c293ccb63f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.1.1"
    sha256 cellar: :any_skip_relocation, catalina:     "c74655097d629696eefdcbb3c7aa8deafee7661a5ee0ddbdecae5941c585ccb6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8a05a1721a38cd7b7ef7484dc5c15fb75f1185b0ee2fce5f69b3fcb6af7bacc7"
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
