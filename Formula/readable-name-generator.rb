class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.12.tar.gz"
  sha256 "108983a79e33e729bd983d75603102309358aeeb4051c14e9bc38ebf82416588"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.12"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "067c1bb9d6d45876154205f0956ee4cc2baf7268e182e3f380e7b112de5edc4a"
    sha256 cellar: :any_skip_relocation, ventura:      "9734ad5d3b836888b73b7b7215b60617e6efa6d2d7a06a684ce32422d5fae1af"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0fc7daf583ae41f6aa1cd79741c3b2f9488fa7dffcd568a7842755dacb7d3c4f"
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
