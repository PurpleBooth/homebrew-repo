class GitMit < Formula
  desc "Minimalist set of hooks to aid pairing and link commits to issues"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/refs/tags/v5.13.17.tar.gz"
  sha256 "751a336cd17ad295fbdb26a187b820ab8c83268ebb67a80aacbc052e298777c4"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-mit-5.13.17"
    sha256 cellar: :any,                 arm64_sonoma: "6a6fb8eaffe593ac563d1a3759b9d85aa2000dd58d6e2241af5ba43320664540"
    sha256 cellar: :any,                 ventura:      "7e74318f6d8b62056c226b57104a50b77d904c54fb088cf7383b96b7f405e60e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c2856adcb3ce955466bb229f53a1d7c95c9fb2bf6641ddfbf8905c63c817140b"
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
      generate_completions_from_executable(bin/binary.to_s, "--completion", shells: [
        :bash,
        :fish,
        :zsh,
      ])

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
