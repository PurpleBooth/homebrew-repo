class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.1.35.tar.gz"
  sha256 "2498b03b76160b216577035a397653e39d3b8632eff60cd50ebd1231fd805800"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.1.35"
    sha256 cellar: :any_skip_relocation, big_sur:      "5923c416d2a9a6b57db00410b8d489086c6f3c2ce63b5890eb8a541bc3b26750"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b46e6a9b9a45348fa727ae0c891685978a86199315007d23f7435755138914a6"
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
