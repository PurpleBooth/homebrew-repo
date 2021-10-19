class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.19.tar.gz"
  sha256 "7e631df0c207e61ef760f873ba00eb8e1fa4993803277a9de8fd73fe0e1696bc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.19"
    sha256 cellar: :any_skip_relocation, catalina:     "7e94ff16b025832d123640d693941c5665057bb9b3c4f811f2822a8534d91a22"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "50673805393add7407ce6e03bf4fd2c1a31a6442dc7e105bcac0f20a4516db30"
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
