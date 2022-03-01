class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.33.tar.gz"
  sha256 "0c008304c43c5fc1c7cddf692d5a05502901fc4b18319f06241268aa06fe5982"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.33"
    sha256 cellar: :any_skip_relocation, big_sur:      "17d1d6b6f044dd2d89f045b09c602b3541aca12af35456ced8c54e798c2b6655"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "81815e523b5a246e39c99bf86c1283d848eb1323c0c738b29fe8e48f0aecfb7c"
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
