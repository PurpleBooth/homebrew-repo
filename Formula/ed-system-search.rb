class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "10a93f6d55899f6e28cae3fa79f5acbbce704fc0dde9018d1210e7b5ca232fe8"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.1.3"
    sha256 cellar: :any_skip_relocation, catalina:     "18f08de51007cba4518f2444eb24dcbd9ef4ae581477b58efef9517bbda2b67d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "84c0cef90cf324896863f089ca0ae325029f570efdbc5a959678ad7d73fb81da"
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
