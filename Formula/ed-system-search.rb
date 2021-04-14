class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "def3bc5b9d84861be03eed5a139d2482886c46b67068f6f347961ccbe907b739"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.0"
    sha256 cellar: :any_skip_relocation, catalina:     "e0180acdd954fe9ac3f946d79223063851b633b43230442d4f9fd060c6aa9a07"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "019b6d76474747df8a01fc470742128960868d4ed6ca2308393443470e86c103"
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
