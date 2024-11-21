class GitMit < Formula
  desc "Minimalist set of hooks to aid pairing and link commits to issues"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/refs/tags/v5.14.2.tar.gz"
  sha256 "19bea4f9d83c5b31d8db0eb9208437b668270b9459897614c32310a7d66ed99c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-mit-5.14.2"
    sha256 cellar: :any,                 arm64_sequoia: "434507e516dd442be558af0221cbdd1481436c84638f2d84af8f23d6039b351d"
    sha256 cellar: :any,                 ventura:       "19cf1a39122c8bfe8fdff327a1187a1066cda7edb69d1f1b527d38bd4b5cec41"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e73998422ebbdbdb4f4bc1441ec7c3cb43779b88d4df81591fcc6b4ae6e2ae39"
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
