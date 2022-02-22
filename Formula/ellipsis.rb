class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.34.tar.gz"
  sha256 "490d01f55f770f52e9e7bf0146396c2c5e4ff5e02c4b34bc38343f2f3219875f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.34"
    sha256 cellar: :any_skip_relocation, big_sur:      "3ae44bc3ffe9e8e169e43dc774ff77fa8d83f34a6b207b1ca4db68747dcd694b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "95e8708c97972c329f84fb93cde3b4d4eb861c9b18690fd1b03c89298a7462f4"
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
