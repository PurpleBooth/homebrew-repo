class GitMit < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/refs/tags/v3.7.0.tar.gz"
  sha256 "c1099d890d30ae46a4cd49e88873c47ea3dca3c0571bf5f2c0a09cd9816c0f30"
  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any
    sha256 "6eab3982a8bab7ec52674c44c37540791e5f1fc5300569d7035dc30774bf3908" => :catalina
  end

  depends_on "rust" => :build
  depends_on "openssl@1.1"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./mit-commit-msg/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./mit-pre-commit/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./mit-prepare-commit-msg/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./git-mit/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./git-mit-config/"

    output = Utils.popen_read("#{bin}/git-mit --completion bash")
    (bash_completion/"git-mit").write output

    output = Utils.popen_read("#{bin}/git-mit --completion zsh")
    (zsh_completion/"_git-mit").write output

    output = Utils.popen_read("#{bin}/git-mit --completion fish")
    (fish_completion/"git-mit.fish").write output

    output = Utils.popen_read("#{bin}/git-mit-config completion bash")
    (bash_completion/"git-mit-config").write output

    output = Utils.popen_read("#{bin}/git-mit-config completion zsh")
    (zsh_completion/"_git-mit-config").write output

    output = Utils.popen_read("#{bin}/git-mit-config completion fish")
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
