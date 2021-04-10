class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "58055e0ea2ebd226673a55b8b8b9ca77e8f23da7abefb123f23c69e5da215591"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.5.1"
    sha256 cellar: :any_skip_relocation, catalina:     "ab8eb173a6334df5d759f5fd34eaf1da177a5d316ecd23d4f15fa91dffa00e6f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8c74df1e370f1d9c836bced319e6fdea947ced829188dae0aa27a0b159c97d11"
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
