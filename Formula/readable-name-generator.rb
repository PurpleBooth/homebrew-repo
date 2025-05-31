class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.67"
  sha256 "7a1de8041ddfcf37e63d6b004c2bdb17d9cebc3a07b38df1bde8892b9e08722e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.67"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "08a8616e469888375898f062fd1351f048cf84d7e3b5b31483d8c6cdacc487c6"
    sha256 cellar: :any_skip_relocation, ventura:       "bb0206fe7611a19bc51936156978ea9596dc8be1a9199981f5aff8b667622b8d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2d7daedb53b3bc6d65eef29e1b8c179f10a506559847fe32790e26845129e074"
  end
  depends_on "help2man" => :build
  depends_on "rust" => :build

  def install
    # Build binary
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."

    # Completions
    generate_completions_from_executable(bin/"readable-name-generator", "--completion-shell",
shells: [:bash, :zsh, :fish])

    # Man pages
    output = Utils.safe_popen_read("help2man", bin/"readable-name-generator")
    (man1/"readable-name-generator.1").write output
  end

  test do
    system bin/"readable-name-generator", "-h"
    system bin/"readable-name-generator", "-V"
    assert_match "flexible_briseglace", shell_output(bin/"readable-name-generator --initial-seed 1")
  end
end
