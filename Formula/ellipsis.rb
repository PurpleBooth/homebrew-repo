class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.29.tar.gz"
  sha256 "05888f06f59aa4ff95c57fbf21887e5d95565a0c0d5483236e76fd084bf19734"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.29"
    sha256 cellar: :any_skip_relocation, big_sur:      "486667b016f72da2efe782c457ae480eedfea169a3827c6dd45fd244c4713699"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4598604c33d26550cf2ab966c8eabde15f79392084159fea31f1c9c1390403b9"
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
