class GitMit < Formula
  desc "Minimalist set of hooks to aid pairing and link commits to issues"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/v5.11.5.tar.gz"
  sha256 "88acb28087c8547af78d1f8f3a54cfcb1f977722822988bdc02cbe911acd81fd"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-mit-5.11.5"
    sha256 cellar: :any,                 catalina:     "c5c7841525ef041ecf47565b6fa3236cdb2c160699786106aaf2d4fdb0faac63"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "100498830bdb5d38e00c8fa8380dadf5ac7373ca9185e2d38f8b70a1c2438431"
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
