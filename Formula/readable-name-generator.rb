class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.32"
  sha256 "04e177b776adce71f0b483cf6a7142acf2ecb08c41dc7575e77032cc16866df9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.32"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a96655c4c625ef912c029301af1633475c0dc5e4009cf6efc57af38315fc58df"
    sha256 cellar: :any_skip_relocation, ventura:       "f7b9a9e71e87a887eb0e9238a8fde47e4dc229e0f8462e8e68e76b5e4846370a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "62022ee868855d715e750063c6aa201e74170edc830ea31c3a0f31dadd6bef06"
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
