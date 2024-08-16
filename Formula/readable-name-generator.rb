class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.101.3.tar.gz"
  sha256 "1c4b75a653817c5cfbab56c1d2817382448dd74429c68d5bb490cb448573e047"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.101.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ac49d32632e2fd153f35570f67b7a19e533816c886f5f1a1123445cde9e0bff3"
    sha256 cellar: :any_skip_relocation, ventura:      "0249b9b399873832b397f3e498546edbf96b99ebf6c674978b835ab60de5b632"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0bfdf9b104cc2503bb22d72f00832048d4376991541730fc9fdf93b99ef66443"
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
