class GitMit < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/refs/tags/v3.4.0.tar.gz"
  sha256 "3e2e343bef563992e1d4844fb45fbaa6db74dca726beab4f78396cc813659f41"
  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any
    sha256 "30b47661ecd79d14e94f134ad568d2d855f31dd2d7a9eb126c0803e00479f1ee" => :catalina
  end

  depends_on "rust" => :build
  depends_on "openssl@1.1"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./mit-commit-msg/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./mit-pre-commit/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./mit-prepare-commit-msg/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./git-mit/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./git-mit-config/"

    output = Utils.popen_read("#{bin}/git-mit --completion bash ig")
    (bash_completion/"git-mit").write output

    output = Utils.popen_read("#{bin}/git-mit --completion zsh ig")
    (zsh_completion/"_git-mit").write output

    output = Utils.popen_read("#{bin}/git-mit --completion fish ig")
    (fish_completion/"git-mit.fish").write output

    output = Utils.popen_read("#{bin}/git-mit-config --completion bash mit example")
    (bash_completion/"git-mit-config").write output

    output = Utils.popen_read("#{bin}/git-mit-config --completion zsh mit example")
    (zsh_completion/"_git-mit-config").write output

    output = Utils.popen_read("#{bin}/git-mit-config --completion fish mit example")
    (fish_completion/"git-mit-config.fish").write output
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
