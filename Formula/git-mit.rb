class GitMit < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/refs/tags/v3.5.0.tar.gz"
  sha256 "f9433bd7f2ad9c07fd8c2eb162ded3094765f84b77e5bf0f425d12bfc693a6f8"
  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any
    sha256 "bedabad8f498b97fce155deee7ee0f3183ba55522bd2eb4e9f9f70e58eb73c5b" => :catalina
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
