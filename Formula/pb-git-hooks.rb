class PbGitHooks < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/pb-git-hooks"
  url "https://github.com/PurpleBooth/pb-git-hooks/archive/refs/tags/v2.121.0.tar.gz"
  sha256 "a46d3c890306048f4b89e931953beca588fab116500a197e81b813e3e5114c5d"
  depends_on "rust" => :build
  depends_on "openssl@1.1"

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
