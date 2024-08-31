class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.4.tar.gz"
  sha256 "eda6a7cbc67b24af2e9a32f6feea35267eaf8feeb96dbb6030839d667991a346"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "cd65b605e717d181f3ad6cc12eaa442994de4516b1e24c1fedfa531babd62fcc"
    sha256 cellar: :any_skip_relocation, ventura:      "ae096c28291d5312fe5c9c17492ff94f878c6856a2e79a1fc9e709db2d7d5192"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4a94cb9aa7ff88eceab4e0e7f6d8d4654379893c204c51fa3f4d9e98a41d7438"
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
