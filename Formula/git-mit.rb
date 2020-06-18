class GitMit < Formula
  desc "My personal git commit hooks"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/refs/tags/v3.12.0.tar.gz"
  sha256 "9306c88847c95837c9cd3bec0108e433c5be7c9c8145e7ccdec4d6bfbe1a8b43"
  depends_on "rust" => :build
  depends_on "openssl@1.1"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./mit-commit-msg/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./mit-pre-commit/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./mit-prepare-commit-msg/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./git-mit/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./git-mit-config/"

    Pathname.glob('**/bash_completion/*').each do |file|
      bash_completion.install file
    end

    Pathname.glob('**/fish_completion/*').each do |file|
      fish_completion.install file
    end

    Pathname.glob('**/zsh_completion/*').each do |file|
      zsh_completion.install file
    end
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
