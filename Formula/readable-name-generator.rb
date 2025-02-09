class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.27"
  sha256 "2a9474431059ab8d84ace10036d45e6b2ab4d78a210543042dca2fb16fadac87"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.27"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cbe8955e4dc78fac7ba41eba66211c056a4f0669de84b166e51d7c1644aea04f"
    sha256 cellar: :any_skip_relocation, ventura:       "1a3c834ddd71c0e6edb747acc5cb20a1775d9d1bb2dd60552069eb84f13b66ad"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e990216dc6aeaedac2d72f248eebbbfac9c7defa5b95ee41fa4d9bf39bbea049"
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
    assert_match "gregarious_pauli", shell_output(bin/"readable-name-generator --initial-seed 1")
  end
end
