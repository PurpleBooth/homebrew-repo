class GitMit < Formula
  desc "Minimalist set of hooks to aid pairing and link commits to issues"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/v5.8.1.tar.gz"
  sha256 "ffc699b077c077b6e91367c012fd8a486f177028b157e339dad05b56fa746459"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-mit-5.8.1"
    sha256 cellar: :any,                 catalina:     "93df5406a969061f6a8244aff1fec2d9edc92c346e300b86c10085c99ca74bb8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "875045eebfcc5a1996dcd569bf0aa4fa184ba309733ed1b5673de025130bdb0c"
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

    Pathname.glob("**/bash_completion/*").each do |file|
      base = file.basename(".bash")
      bash_completion.install file => base
    end

    Pathname.glob("**/fish_completion/*").each do |file|
      fish_completion.install file
    end

    Pathname.glob("**/zsh_completion/*").each do |file|
      zsh_completion.install file
    end

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
