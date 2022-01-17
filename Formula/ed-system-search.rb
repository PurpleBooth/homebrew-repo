class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.20.tar.gz"
  sha256 "8c7a5ee03bf6c7a64ab34ab876267802def1f652871d7dc42b7673f0d30e1afc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.20"
    sha256 cellar: :any_skip_relocation, big_sur:      "47b759c538caa188c1c9cbd1ff0e2b8ab81135eee9f674e754b7c03818271894"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4a88356d2c4ff25aa70333d974e925ba4f52d4106972f8617fa57fa15e58236b"
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
