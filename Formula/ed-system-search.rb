class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/v1.0.14.tar.gz"
  sha256 "342d42e838ffacc7821efdf977baa911eb28138ba8e80c74bb06cf4e14293d97"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-1.0.14"
    sha256 cellar: :any_skip_relocation, catalina:     "e1fe136e579be9916e6328cb7a7dcb7aef6d7b94b8bae1c07a23f16fe58dd211"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8d51fe6dab69e6c0c5cd87773874dab17e71d51355eee7399be2a0fbec17ac74"
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
