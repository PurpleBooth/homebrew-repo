class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.11.6.tar.gz"
  sha256 "75ce930973bafa7c13e0faa2f95fb2f81d1ff3a5e42e3968c8df9709f97148e1"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.11.6"
    sha256 cellar: :any_skip_relocation, catalina:     "1be31ca985f630d55eb63829b87c93dbc07c90ea44e0c82c5077ed4425cb8c8f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "666252fcb565c8acd0d54ba5845a32d4525f98a9148e8063866941250cdd9ceb"
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
