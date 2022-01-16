class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.19.tar.gz"
  sha256 "a9f8bd8882e29ddf3f1d8cbc8b3e6873fce53f2df580de768a0c79da36df47c7"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.19"
    sha256 cellar: :any_skip_relocation, big_sur:      "51c65a21c8da30fb83daba376d3a6ee2bab3e7c858752243ebf7aced04e435f8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b362d56dc4d79c780148d33a22a0ecdd4d460075c05ae15844eea38a429eea30"
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
