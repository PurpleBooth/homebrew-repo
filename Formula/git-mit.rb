class GitMit < Formula
  desc "Minimalist set of hooks to aid pairing and link commits to issues"
  homepage "https://github.com/PurpleBooth/git-mit"
  url "https://github.com/PurpleBooth/git-mit/archive/refs/tags/v3.98.70.tar.gz"
  sha256 "dcdd72ecf8341e05e021d076359b772a67999848cc4bd774fd428a2191286817"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-mit-3.98.70"
    sha256 cellar: :any,                 catalina:     "a78057f2a9067d414ac365842a3410996bf3510e15211a38ec9a62e4b459f453"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ebcf4e3b0a9b8fc5b50d30f28310152bab61a2e5667de843271c6427acc0a1f2"
  end
  depends_on "pandoc" => :build
  depends_on "rust" => :build
  depends_on "git"
  depends_on "openssl@1.1"
  on_linux do
    depends_on "libxcb"
  end

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./mit-commit-msg/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./mit-pre-commit/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./mit-prepare-commit-msg/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./git-mit/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./git-mit-config/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./git-mit-relates-to/"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "./git-mit-install/"

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

  test do
    system "git", "init", testpath
    system "#{bin}/git-mit-install"
    output = Utils.popen_read("#{bin}/git-mit-config", "mit", "example")
    (testpath/"git-mit.toml").write output
    system "#{bin}/git-mit", "-c", "git-mit.toml", "se"
    system "git-mit-relates-to", "#12356"
    system "git", "add", testpath
    system "git", "commit", "-m", "Exammple Commit"
    system "#{bin}/git-mit-config", "lint", "available"
  end
end
