class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.20.tar.gz"
  sha256 "4c69147e81d18dd6a26ea0ad30b92ffcdf4bfb10def3332a8fb9a97004068420"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.20"
    sha256 cellar: :any_skip_relocation, catalina:     "703d697687dc2ac0531ee8b89f3114a550ae325f161a4d124b15182ccdd85eb9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a394d74db5998e22944b727bf0e765502932e2e8a1cf0f192e22189fa7c0881c"
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
