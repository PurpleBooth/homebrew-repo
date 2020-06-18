class GitMit < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/refs/tags/v3.11.0.tar.gz"
  sha256 "07493eeb694befc6a90b3e71d82eb96e81ddfbb236f7b40f1a8c9b28d36b6510"
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
