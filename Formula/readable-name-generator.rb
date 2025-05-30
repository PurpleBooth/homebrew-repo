class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.66"
  sha256 "1cffb84c3a17c09e76cec7d2a3c122d1fd9dd7fb50ce27c86be3238db5780681"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.66"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "110385a9943f8dfc5b57e1916de7cbd08f80869aaa7d0fb6369dc7861a9661ba"
    sha256 cellar: :any_skip_relocation, ventura:       "0573c1d26cb3dd4bdeeed48f288b5487edcfe9fb582f3f2f495b13590d3a6e9b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "659ce33198a32ff38d2430f8eaf688331ad167184d67ecdd4df7884287317700"
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
