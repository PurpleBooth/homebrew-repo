class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.0.19.tar.gz"
  sha256 "7a76256cbc0ab1d0c3dd1e1825c0be0a5e9a1693f32e371cd781a9ef34091134"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.19"
    sha256 cellar: :any_skip_relocation, catalina:     "6434a675a5a078bacc85cb03439a2f866c404773a87c0b80a2ee253ac03456f4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fa74980d1182d031854e889cec10ba09f78ddddecc913b964b003fbcb412bdf0"
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
