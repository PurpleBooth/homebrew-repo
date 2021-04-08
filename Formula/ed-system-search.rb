class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "94e724ab327290795c4d0b6d07bfd3fd4a3b6451683041b51a66c25b7aad5763"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.1.0"
    sha256 cellar: :any_skip_relocation, catalina:     "9f6e29b5bd1265cc35d775a438149f5c47b68b2485d22b2cf95f1719f5fed81c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5570af07fb9379649e70f0283349e8f5cc2c0a339f962d17c9a6b4159ab540ea"
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
