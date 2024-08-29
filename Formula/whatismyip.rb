class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "bc76c8ba4904a34175d2ab7d5c2800a58ebfe654625af0aba489b6a5f282091a"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.13.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6280a5a23b4fad6e9801b5acb75cfac5828eda7f2f93355631f60ca133ae76f3"
    sha256 cellar: :any_skip_relocation, ventura:      "610cd9b85d9b6c0a0684d95037343232b586a974bad227e09e33617e71146d03"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b4e339e18a3cc0fbcd5f6b4c513fe071088c6ce38f73cda4130d536f5404f5b3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/whatismyip", "-h"
    system "#{bin}/whatismyip", "-V"
  end
end
