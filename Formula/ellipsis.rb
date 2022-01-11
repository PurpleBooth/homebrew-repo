class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.28.tar.gz"
  sha256 "b857c4c1b4913538294b82ac054d8ce344923822ed78088c1d4035d6aee98e3f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.28"
    sha256 cellar: :any_skip_relocation, big_sur:      "4c9b2850a008d6f07f2afcaaefb21d90c67054ddeebca22eeb24b5469e2524f3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "826da28981088e994875f5843e4caed722911cba62b9bc9552412ce5b05e2a4f"
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
