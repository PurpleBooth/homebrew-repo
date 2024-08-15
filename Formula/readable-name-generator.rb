class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.101.0.tar.gz"
  sha256 "373537683d6c9a90fe7bdbf184ca7ab1a8b197dbd7403fedeaff23c5f458d40d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.101.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6a1296b4f454e889ef1d7fa75ac6e4ba475f04ec9e14baab3530f7f34de71125"
    sha256 cellar: :any_skip_relocation, ventura:      "6fcceef7fc60d5367d3d565b6fc275906930d6c55b50d3c77722d100f4a06901"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d89122c4e73e57288d1fb8e5e9428711d902e55978f8cf4dbaa2812da28a2d44"
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
