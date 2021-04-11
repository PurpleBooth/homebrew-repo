class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.10.2.tar.gz"
  sha256 "f87ebde95eb70a7a3c8af1460ea3497b441355550abc5058b9c5e93c18f22fcf"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.10.2"
    sha256 cellar: :any_skip_relocation, catalina:     "e244929c59b9bc51af8857ffe600382904823e68b2c150c80ad971ed68a009c8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8aea0212ba48da79c99edde122e40a8644f99bde72a98f9751e0a1c10ed86003"
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
