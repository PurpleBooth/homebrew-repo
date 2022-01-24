class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.30.tar.gz"
  sha256 "152fdf35207de89b198e3066f8bc966667de78a53ce87a354f767b999b768719"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.30"
    sha256 cellar: :any_skip_relocation, big_sur:      "1d44de44503f2d2fcd8771334e6f3fa3807aaebcb11aa4f624559a25bb7f057b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "71fa9dfbf3d9aae89467efe28a3f758657d881b3ba8b7d2238bf6e40467880a4"
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
