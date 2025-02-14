class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.31"
  sha256 "6009c3abe2e0aaff64c8724b15af40a614c2f61d8f8996fa06b312ee08265f02"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.31"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2d863c20cf6424db058f40e78a1ed0cd6dbf576be1b055e562abd86558578aa4"
    sha256 cellar: :any_skip_relocation, ventura:       "82f644415b19dca70793250c79dbf54320432d51195eeb7bec3c8e9353a83247"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "67e269be170b5cddb5b4df3a0213fc72f1b3ac9af5e680b11ae35ca6cc55cf7c"
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
