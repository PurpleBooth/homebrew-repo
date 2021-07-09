class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.5.tar.gz"
  sha256 "052f9667d56fa01c91e454d63b6e4c2f6d8d9dbbc37a9590da57827a5783f956"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.5"
    sha256 cellar: :any_skip_relocation, catalina:     "ab47dd516a6f244408e44aed483a4cda546452bd1af374abf994f68b161c5252"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e3eae987aa3d96004c9a20afddbf119c121736dba3d88acfc3eff9122ff37cda"
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
