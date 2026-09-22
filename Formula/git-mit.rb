class GitMit < Formula
  desc "Minimalist set of hooks to aid pairing and link commits to issues"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/refs/tags/v6.5.6.tar.gz"
  sha256 "603c0a07d5a9ddd4827bc166990693e79b37f3a09c4bf47b0dbcf20c416aa63e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-mit-6.5.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "23eae18db31a3c403c03648f47966dcc0921741a07639875724a8867795f2f55"
  end
  depends_on "help2man" => :build
  depends_on "homebrew/core/rust" => :build
  depends_on "openssl@3"
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
      system "cargo", "install", *std_cargo_args(path: "./#{binary}/")

      # Completions
      generate_completions_from_executable(bin/binary.to_s, "--completion")

      # Man pages
      output = Utils.safe_popen_read("help2man", bin/binary.to_s)
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
    system bin/"git-mit-install"
    output = Utils.popen_read(bin/"git-mit-config", "mit", "example")
    (testpath/"git-mit.toml").write output
    system bin/"git-mit", "-c", "git-mit.toml", "se"
    system bin/"git-mit-relates-to", "#12356"
    system "git", "add", testpath
    system "git", "commit", "-m", "Example Commit"
    system bin/"git-mit-config", "lint", "available"
  end
end
