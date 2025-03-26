class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.45"
  sha256 "5dbcbf4bdc950d4e12acc0591963eccfc559153316b3a761dbf4984025ab01d7"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.45"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3cf1c4f6c6dfc8a1086ee10f24ac951999c0f21d69fcc639e2e64cba1caaa719"
    sha256 cellar: :any_skip_relocation, ventura:       "22f41878b26541be656a9f4c7a0d5d9ccbbfe9c6b479094628a0ac1888c58f26"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0a998521080f9577246859c1f52adc9f60c5b59fc0900a1d47d65036346dc036"
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
