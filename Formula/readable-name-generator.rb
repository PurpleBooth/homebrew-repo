class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.39"
  sha256 "475e6d59ff7a64ad4a916171c5a4aaff24431c5f024c8e5370f2e53056d8924f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.39"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f98d669e0bdbdeb78a51a6e436465fc271be6478b8c4bf35c75b5ad58e36b603"
    sha256 cellar: :any_skip_relocation, ventura:       "7515ec2e3a7d3a932cef76a21c91d1b17462b1e82c8a9f17b66459d6ce103e30"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b483a0b1cea704a398c4dc114003e71566fc4d10d57d1ab1f0ee06b42fe5347c"
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
