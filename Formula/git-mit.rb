class GitMit < Formula
  desc "Minimalist set of hooks to aid pairing and link commits to issues"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/v5.12.67.tar.gz"
  sha256 "2330e25c4a2dfe7c9135bf03a66a43e9eec67bf8cacbd8373172314b44d86410"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-mit-5.12.67"
    sha256 cellar: :any,                 big_sur:      "c16cb9423326afb9725ec8e68ddd8420d34465504881170e63abef83c40eab32"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3733d0e96ca1bca215d249fcf6d5a25a82d1fe11cc64c3503c986457a001f013"
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
