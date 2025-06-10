class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.70"
  sha256 "e0fce909130987b2b324b7ff3298cc1a3221895aee13f1260acb25ef3e29a59b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.70"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9d95f7fbab9f39e955a7ca9daf5b0c34058f52ae96a06976a066ace7292d79f1"
    sha256 cellar: :any_skip_relocation, ventura:       "ffd2d7cffed15dcd1d841717397c182558733611be8168b7ba4ecb8d33efe1ae"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "53ec886eba8b09dc0554bfea05affdf5cca23951233cc417b0bd709d706660a6"
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
