class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.35.tar.gz"
  sha256 "3e97fe724ff4a1379807fb00fb2bd3184e23dcad1a4f69adeedd7cbd984947e9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.35"
    sha256 cellar: :any_skip_relocation, big_sur:      "b8e75e12b1e4f064f7f39f001aac140c04f7de4865d4a36d7f4cd04e0cfe99be"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "48c7e7b2113815ee9193d030dbd8362a2f5c9baedbcabe8ca0adb2cfadfed9f5"
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
