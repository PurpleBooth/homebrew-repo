class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.31.tar.gz"
  sha256 "081e6877be97b2f4f1b559414a28a7c91f66441260a9f00dae25e813c9cb7ee3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.31"
    sha256 cellar: :any_skip_relocation, big_sur:      "700123c6eec07826209b244326d04de3bb5fbe6d8842d009322d257267d43307"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0cf63359efa7a9e5dd31efd755adefa52bd06907c8e108945ac497360a332e3c"
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
