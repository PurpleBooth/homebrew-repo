class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.50"
  sha256 "7f2d4771beab92c3cfc55cada1370c89ac56b575f1176559b7362f3106b6f5b2"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.50"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "eb374615ae7b3112cbf535e676c0f6ee05c1ad4f49d05915347bdd53b79b8d97"
    sha256 cellar: :any_skip_relocation, ventura:       "13f9ee0010473f98fc55259fc92e7d0cf664def2f37641f6963ed6e50c7935ea"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "504ff84b0885f6abb107b4b47b0c67e81cd085e8eb0d028ff5bf4b4bbec1d1a7"
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
