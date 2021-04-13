class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.11.2.tar.gz"
  sha256 "afcbefcad7c66e17b2f4d04d00d1609b9b145d0e577a73b85485b57ff02d0228"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.11.2"
    sha256 cellar: :any_skip_relocation, catalina:     "3bda256f471dd4b27740e9e815e9f7cfa0ff1ab6d620423198d10857f0402a8f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b151776dfeb4f435858bc11033e02e92c74183fbe147f7548d277133c7c83092"
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
