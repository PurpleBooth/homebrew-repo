class GitMit < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/refs/tags/v3.6.0.tar.gz"
  sha256 "31a011569effa0d5a886933e26d04febccf663f80b8c1243693c5bd39a0de1b5"
  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any
    sha256 "bd2aa720a0538f6f2c4efe59b093dd82ab69fb886e421ade66a7b128a2862656" => :catalina
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
