class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.11.3.tar.gz"
  sha256 "ec1a3c22593d1ee31c5152143f497889693185d199d089a047fafcc0ffb88950"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.11.3"
    sha256 cellar: :any_skip_relocation, catalina:     "737200a06fc5bc06505ac6232771c032d39fd4e5f7206b7bdc105009af7b9c80"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "93ba94447c243086d71b5a45f5f6798d5a48c9b8529079dff5469e154c4809dd"
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
