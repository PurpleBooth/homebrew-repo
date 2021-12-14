class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.12.tar.gz"
  sha256 "444cd2a8a3e9c1b8b302605c2959f2db8547a8be6ade9b2b78e4d68c58662fe6"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.12"
    sha256 cellar: :any_skip_relocation, big_sur:      "74a44a6ce4ece6882d43314b3d440b76986e6ddbb7a52eb0206eea54b026516f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "697ffe9fe6430b96de14c036c7b84aed411927660efed2a572a92c4a45d68a3d"
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
