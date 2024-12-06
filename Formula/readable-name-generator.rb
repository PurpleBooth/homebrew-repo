class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.23.tar.gz"
  sha256 "7554640a4fd34ac559b226764d7ac3c833b7c34eabcc9f49c5b29c67c8b38c4d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.23"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "94c9599b9301f9e953ed6c0445c6f35f4edc89ef107916a5429db15ec7df339e"
    sha256 cellar: :any_skip_relocation, ventura:       "93b60d01832178c855ea021be1ac9fce503bad58d4168edf507ad766f2b20bd4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b52ada7ce06ab06c147aa31ddafc0805cbfbe35b63699fcbd678e2c7e3ebee2c"
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
