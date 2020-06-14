class GitMit < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/refs/tags/v3.0.1.tar.gz"
  sha256 "5279da9b0853a84d2a92b3420bdd0ca431715fd28b1f6b896476649c44e33b60"
  depends_on "rust" => :build
  depends_on "openssl@1.1"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./mit-commit-msg/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./mit-pre-commit/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./mit-prepare-commit-msg/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./git-mit/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./git-mit-config/"
  end

  test do
    system "#{bin}/mit-commit-msg", "-h"
    system "#{bin}/mit-commit-msg", "-V"
    system "#{bin}/mit-pre-commit", "-h"
    system "#{bin}/mit-pre-commit", "-V"
    system "#{bin}/mit-prepare-commit-msg", "-h"
    system "#{bin}/mit-prepare-commit-msg", "-V"
    system "#{bin}/git-mit", "-h"
    system "#{bin}/git-mit", "-V"
    system "#{bin}/git-mit-config", "-h"
    system "#{bin}/git-mit-config", "-V"
  end
end
