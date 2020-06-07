class PbGitHooks < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/pb-git-hooks"
  url "https://github.com/PurpleBooth/pb-git-hooks/archive/refs/tags/v2.106.0.tar.gz"
  sha256 "0cfb768564b3708017f35568c78b9b742e9c8ac3e91b9af8b16831d18d2524b0"
  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any
    sha256 "0477e198c5125c188ea8fe5c5b65640ae7d506f8c9bb027c4176eda6101d3027" => :catalina
  end

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
