class GitMit < Formula
  desc "Minimalist set of hooks to aid pairing and link commits to issues"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/v5.12.84.tar.gz"
  sha256 "fda6d2d9c963d546e805aadffe0547571a78c6ac8edc8e183c85fdc042f35039"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-mit-5.12.84"
    sha256 cellar: :any,                 big_sur:      "8c17187e7f4c287a5166ab33d73bd23ec15607f04cde626010606176ad8d54ba"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0a6057da8ab094543195a3b8578b120fe097d4f2554e39d2215b6b42ca84b8e2"
  end
  depends_on "help2man" => :build
  depends_on "rust" => :build
  depends_on "openssl@1.1"
  on_linux do
    depends_on "libxcb"
    depends_on "libxkbcommon"
  end

  def install
    %w[
      mit-commit-msg
      mit-pre-commit
      mit-prepare-commit-msg
      git-mit
      git-mit-config
      git-mit-relates-to
      git-mit-install
    ].each do |binary|
      # Build binary
      system "cargo", "install", "--root", prefix, "--path", "./#{binary}/"

      # Completions
      output = Utils.safe_popen_read("#{bin}/#{binary}", "--completion", "bash")
      (bash_completion/binary.to_s).write output
      output = Utils.safe_popen_read("#{bin}/#{binary}", "--completion", "zsh")
      (zsh_completion/binary.to_s).write output
      output = Utils.safe_popen_read("#{bin}/#{binary}", "--completion", "fish")
      (fish_completion/binary.to_s).write output

      # Man pages
      output = Utils.safe_popen_read("help2man", "#{bin}/#{binary}")
      (man1/"#{binary}.1").write output
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
