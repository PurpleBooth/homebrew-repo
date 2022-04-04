class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.40.tar.gz"
  sha256 "6f942101f616a1513bcc5ed8d0a58659ee34af9791d2d81f40a5dcf85aa5a28d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.40"
    sha256 cellar: :any_skip_relocation, big_sur:      "5d1447fc72a95a8e2fc609d13b6a01053d9ebfe6a8eecdd1880ec6c44f7b9e37"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "44fcd435d378a4533e9be4b35528302c9fb50bc6d05b7849bb1ff363be6d3cb0"
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
