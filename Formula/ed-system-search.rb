class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.47.tar.gz"
  sha256 "2ba3e16096dafd23e4856d605dff91b7fe2594e1d6f2648267a69f9007937e3c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.47"
    sha256 cellar: :any_skip_relocation, big_sur:      "d12870b643d734aa8c280804ad450fe5493260faa5d591c6e64a647f43221a12"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8e282474eea46f7ad45b1f2ad4444dd4488eff5be35b61fab6ab3ef8fcbd9dc6"
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
