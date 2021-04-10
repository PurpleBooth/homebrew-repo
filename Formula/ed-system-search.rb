class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "02800c6bfd490bb35e47151007a85b6387ed9f2de3a7056c7d1af469ad0a6a39"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.3.0"
    sha256 cellar: :any_skip_relocation, catalina:     "e01fb8d3c18090c4081e2fb5e10f2813a70d4570559fdefc360e571344c55145"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a67aa52594ddf2b4a337f36c34f379e14576a92943b68db2c4c83683058cd260"
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
