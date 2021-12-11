class GitMit < Formula
  desc "Minimalist set of hooks to aid pairing and link commits to issues"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/v5.12.9.tar.gz"
  sha256 "8487683a6359a1c922a2568f17f0a5d42f39b1154e5e36eb00e2f589223f2fbd"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-mit-5.12.9"
    sha256 cellar: :any,                 catalina:     "8320701b6be3b84e0fc0ff4cd43af89ae7c4a34c3f4171bc60557aeaa8f52722"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d070b101d55b16fc09a5638f8f6a6292203f2bda6585ac2abf0a5f8141813560"
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
