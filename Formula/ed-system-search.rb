class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.0.10.tar.gz"
  sha256 "ce8be5166a96f082a02f4696719f9f160d05b29bab664a275d645ac1554df84c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.10"
    sha256 cellar: :any_skip_relocation, catalina:     "daeb2e23cdcd698ea0088e094413ca8991cf4b2cd5e814a083f7f5f1d38474ac"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "59a31a2063be8b4715f2d2d872cdb801bd3cc52016a9097251e6260b6360d26d"
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
