class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.6.3.tar.gz"
  sha256 "b0d2732230895aea42e439a20f62d858a0508a00e16894c5e573efa33603e633"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.6.3"
    sha256 cellar: :any_skip_relocation, catalina:     "38da744b3fe744ae5b84321e46f7790bc621867918baa0777c1c3214ac2326ea"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "52f5b8b95f771c7d35109099343c3e8d81c35f113c5f36f87d8f35e55c3a6039"
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
