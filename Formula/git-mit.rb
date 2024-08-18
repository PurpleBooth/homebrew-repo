class GitMit < Formula
  desc "Minimalist set of hooks to aid pairing and link commits to issues"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/refs/tags/v5.13.19.tar.gz"
  sha256 "4e878f404f780b93f04d02a4bbd53823274cc75c986d53e90ffa93e10ee55544"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-mit-5.13.19"
    sha256 cellar: :any,                 arm64_sonoma: "7068e0638b1eec90b6701bd478e5b364350f28af2b02dcac5a8997ec2548c92d"
    sha256 cellar: :any,                 ventura:      "b4cc646ace5ff5d7274e7c5221a9db8600ec970c9dd1bb4e152b890c97ddbc0f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aec2895d2b8c1408b7fbb07658e0cdbbecb5b9ec6d40447cf2d08e2d730c329e"
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
