class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "009e666c87296ae69faa9f8af06f36bfced95f2cff099d0ff1262cbb639e3e6c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.5.2"
    sha256 cellar: :any_skip_relocation, catalina:     "d509ab6d2e52edd9a05d13882fefcc478e13761e8ddacbcce91fcc54b57cb2b9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e8de04685028e9c64f4f28ba46128fa58a9f98fba9693b451bef77b3737a336b"
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
