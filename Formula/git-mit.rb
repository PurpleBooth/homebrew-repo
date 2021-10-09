class GitMit < Formula
  desc "Minimalist set of hooks to aid pairing and link commits to issues"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/v5.10.2.tar.gz"
  sha256 "79a2f4a14ef626aa439d6c3b249eac311ce8374ce12ba58c9747c117fbc0d5a9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-mit-5.10.2"
    sha256 cellar: :any,                 catalina:     "719c2da3d63953bb972337aed0c3d2aeb64b8b507e0fbc20778c3c019cdf9180"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "26fb3015e5f9cdb1932ca9b09d80cd36ebe4d8ce7d1d45deeff5a872036d24b7"
  end
  depends_on "pandoc" => :build
  depends_on "rust" => :build
  depends_on "openssl@1.1"
  on_linux do
    depends_on "libxcb"
    depends_on "libxkbcommon"
  end

  def install
    system "cargo", "install", "--root", prefix, "--path", "./mit-commit-msg/"
    system "cargo", "install", "--root", prefix, "--path", "./mit-pre-commit/"
    system "cargo", "install", "--root", prefix, "--path", "./mit-prepare-commit-msg/"
    system "cargo", "install", "--root", prefix, "--path", "./git-mit/"
    system "cargo", "install", "--root", prefix, "--path", "./git-mit-config/"
    system "cargo", "install", "--root", prefix, "--path", "./git-mit-relates-to/"
    system "cargo", "install", "--root", prefix, "--path", "./git-mit-install/"

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/mit-commit-msg", "--completion", "bash")
    (bash_completion/"mit-commit-msg").write output
    output = Utils.safe_popen_read("#{bin}/mit-pre-commit", "--completion", "bash")
    (bash_completion/"mit-pre-commit").write output
    output = Utils.safe_popen_read("#{bin}/mit-prepare-commit-msg", "--completion", "bash")
    (bash_completion/"mit-prepare-commit-msg").write output
    output = Utils.safe_popen_read("#{bin}/git-mit", "--completion", "bash")
    (bash_completion/"git-mit").write output
    output = Utils.safe_popen_read("#{bin}/git-mit-config", "--completion", "bash")
    (bash_completion/"git-mit-config").write output
    output = Utils.safe_popen_read("#{bin}/git-mit-relates-to", "--completion", "bash")
    (bash_completion/"git-mit-relates-to").write output
    output = Utils.safe_popen_read("#{bin}/git-mit-install", "--completion", "bash")
    (bash_completion/"git-mit-install").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/mit-commit-msg", "--completion", "zsh")
    (zsh_completion/"_mit-commit-msg").write output
    output = Utils.safe_popen_read("#{bin}/mit-pre-commit", "--completion", "zsh")
    (zsh_completion/"_mit-pre-commit").write output
    output = Utils.safe_popen_read("#{bin}/mit-prepare-commit-msg", "--completion", "zsh")
    (zsh_completion/"_mit-prepare-commit-msg").write output
    output = Utils.safe_popen_read("#{bin}/git-mit", "--completion", "zsh")
    (zsh_completion/"_git-mit").write output
    output = Utils.safe_popen_read("#{bin}/git-mit-config", "--completion", "zsh")
    (zsh_completion/"_git-mit-config").write output
    output = Utils.safe_popen_read("#{bin}/git-mit-relates-to", "--completion", "zsh")
    (zsh_completion/"_git-mit-relates-to").write output
    output = Utils.safe_popen_read("#{bin}/git-mit-install", "--completion", "zsh")
    (zsh_completion/"_git-mit-install").write output

    # Install fish completion
    output = Utils.safe_popen_read("#{bin}/mit-commit-msg", "--completion", "fish")
    (fish_completion/"mit-commit-msg.fish").write output
    output = Utils.safe_popen_read("#{bin}/mit-pre-commit", "--completion", "fish")
    (fish_completion/"mit-pre-commit.fish").write output
    output = Utils.safe_popen_read("#{bin}/mit-prepare-commit-msg", "--completion", "fish")
    (fish_completion/"mit-prepare-commit-msg.fish").write output
    output = Utils.safe_popen_read("#{bin}/git-mit", "--completion", "fish")
    (fish_completion/"git-mit.fish").write output
    output = Utils.safe_popen_read("#{bin}/git-mit-config", "--completion", "fish")
    (fish_completion/"git-mit-config.fish").write output
    output = Utils.safe_popen_read("#{bin}/git-mit-relates-to", "--completion", "fish")
    (fish_completion/"git-mit-relates-to.fish").write output
    output = Utils.safe_popen_read("#{bin}/git-mit-install", "--completion", "fish")
    (fish_completion/"git-mit-install.fish").write output

    Pathname.glob("**/*.man.md").each do |file|
      base = file.basename(".man.md")
      system "pandoc", "--wrap=auto", "-s", "-f", "markdown", "-t", "man", file, "-o", "#{base}.1"
      man1.install "#{base}.1"
    end
  end

  def caveats
    <<~EOS
      Update your git config to finish installation:
        # Install into existing repository
        $ git mit-install
        # Install into all new repositories
        $ git mit-install --scope=global
    EOS
  end

  test do
    system "git", "init", testpath
    system "#{bin}/git-mit-install"
    output = Utils.popen_read("#{bin}/git-mit-config", "mit", "example")
    (testpath/"git-mit.toml").write output
    system "#{bin}/git-mit", "-c", "git-mit.toml", "se"
    system "git-mit-relates-to", "#12356"
    system "git", "add", testpath
    system "git", "commit", "-m", "Example Commit"
    system "#{bin}/git-mit-config", "lint", "available"
  end
end
