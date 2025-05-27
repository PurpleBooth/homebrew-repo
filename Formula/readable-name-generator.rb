class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.65"
  sha256 "e356401b7bbe3c9e632daca4b09e4f760d3ecdf20b01c9aebd133ea0cd36d73c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.65"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d87453779a9258f8760a81570eb2890f4424c216054a1e0e65cf2bd4d3e30f7f"
    sha256 cellar: :any_skip_relocation, ventura:       "2cc68776fb3f0d727cff79822557fbad3394411e10e520e475e279a40756ee4e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d86f5abf7b9fa0fee14d682fc39daead11486e6fdbcb124e590567360edb4ef0"
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
