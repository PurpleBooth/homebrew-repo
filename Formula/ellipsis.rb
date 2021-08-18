class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.9.tar.gz"
  sha256 "577aeda0c68571947a85c105d24e1bf275f7c88068b68f7c9bd42ae0d3fa6302"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.9"
    sha256 cellar: :any_skip_relocation, catalina:     "84deef1eeedf19f523c0332fc9a267e0fd10269bf76cb7d78229087d0a7ff78f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "08e09daec4f27c23ae2dfd4127702325b38ea9450474a2007079b13f034f0b69"
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
