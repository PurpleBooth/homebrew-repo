class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.26.tar.gz"
  sha256 "9019b2845d46e9887c3daa109d1dafc4693012ce8d17131a26945279caefd61b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.26"
    sha256 cellar: :any_skip_relocation, big_sur:      "514ce3f950401cc9a06b6460fd3d575ae595954d7f88b5c320612b54ac8d6b45"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8181ee0c84b92e88e367878862a5bf52d8c4682cac5c9b2d981c991d738c23ff"
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
