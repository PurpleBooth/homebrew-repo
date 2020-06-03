class PbGitHooks < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/pb-git-hooks"
  url "https://github.com/PurpleBooth/pb-git-hooks/archive/v2.79.0.tar.gz"
  sha256 "ffe24c6d685e8ff1a886427ea0f6b2195894a54b38a0ccaf25d0b2afb5b6a4e8"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./pb-commit-msg/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./pb-pre-commit/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./pb-prepare-commit-msg/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./git-authors/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./pb-git-hooks/"
  end

  test do
    system "#{bin}/pb-commit-msg", "-h"
    system "#{bin}/pb-commit-msg", "-V"
    system "#{bin}/pb-pre-commit", "-h"
    system "#{bin}/pb-pre-commit", "-V"
    system "#{bin}/pb-prepare-commit-msg", "-h"
    system "#{bin}/pb-prepare-commit-msg", "-V"
    system "#{bin}/git-authors", "-h"
    system "#{bin}/git-authors", "-V"
    system "#{bin}/pb-git-hooks", "-h"
    system "#{bin}/pb-git-hooks", "-V"
  end
end
