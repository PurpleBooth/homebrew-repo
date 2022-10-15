class GitMit < Formula
  desc "Minimalist set of hooks to aid pairing and link commits to issues"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/v5.12.92.tar.gz"
  sha256 "aab003dcb20f0a3426496f0f86873da12fe52ad7b05be79b1ced5cb934498a16"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-mit-5.12.92"
    sha256 cellar: :any,                 big_sur:      "c4d6df54363f9199b16cf7ba78a936e044869cc8fdd38625f07539922f96a363"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e529164fe4050ee2766d6e4f8f41fa804d649bca625209aa643d55b29a1034c2"
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
      generate_completions_from_executable(bin/binary, "--completion", shells: [:zsh, :bash, :fish])

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
