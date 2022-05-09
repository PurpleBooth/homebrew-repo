class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.44.tar.gz"
  sha256 "5d3a8dcee9c9c876e75c4d69ec9ab884acd3c00950e37bd4e5d269a283ed0017"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.44"
    sha256 cellar: :any_skip_relocation, big_sur:      "4a0f167d866a06d0671aa6691e1e4b266d94bd23bd9b7436f40bf00f9f501348"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6fe9d9551d4c76ac32598089a5c04c5eaaca2dfa3a5d5e1d24e2721c4f1f3b3d"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ellipsis", "-h"
    system "#{bin}/ellipsis", "-V"
  end
end
