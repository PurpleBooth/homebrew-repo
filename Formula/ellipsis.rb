class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.57.tar.gz"
  sha256 "ecc3844e5eea24a8e2aa17c3d8e2174741140887430229f5d414d282676a2706"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.57"
    sha256 cellar: :any_skip_relocation, big_sur:      "59521301a0d45822c96923070fe871a008e1fb6d01db1a42cd2ce725605278ed"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dad117d8a24c991929a0c4821f237c00f1f24775378cb8b324c1bcf437344065"
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
