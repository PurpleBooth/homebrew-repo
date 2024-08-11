class GitMit < Formula
  desc "Minimalist set of hooks to aid pairing and link commits to issues"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/refs/tags/v5.13.12.tar.gz"
  sha256 "1904c73b705a44e0436149b6c40af8f92f248f3ac3266234baeb352b97c4407c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-mit-5.13.12"
    sha256 cellar: :any,                 arm64_sonoma: "9bd3257650582881bd35308a18182be3adc20ac0cd0db238c6bdff16271d0819"
    sha256 cellar: :any,                 ventura:      "82a648fbdfd7f06a0524ce9272a0f057a0188af3c36eb628a648835ab7b085e5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3a90d18fbb803ba34d96e8b3a6d1ba84451215961c972badfe18af764fc73c9d"
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
