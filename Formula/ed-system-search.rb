class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.3.tar.gz"
  sha256 "3bf31b4e6f8c79fb0a18ef1f2a4732df9d597b3c09d8a29a25e28e3f76d8934c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.3"
    sha256 cellar: :any_skip_relocation, catalina:     "5d210952da52ff44037e5882399668a2c3e96f5b8976e9460d59a4fde94f824c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dacd329ab79228229bc04975b62cad0b67a431a15f8948b957790b54b2db6720"
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
