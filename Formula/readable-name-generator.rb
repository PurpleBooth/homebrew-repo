class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.59"
  sha256 "0918833658699d41fb7523f4b8032825930674b56afa0fa8f463eb99a4eb7f88"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.59"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ee2cc1a0fef21d814b97f98f5c5acd2e03459e648ccb6e20153a721a4516a214"
    sha256 cellar: :any_skip_relocation, ventura:       "879db6dde518a6d1679731cb34fe9797bd12c241b0adc660d3466faf4ba2b8cd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e4ee70f43686524d62728486d2812841cadbd2b179e4265755fcd55d9bfb0445"
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
