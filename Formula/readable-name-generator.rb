class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.13.tar.gz"
  sha256 "cd85e45fbf6baf2b9123672a53d43fd64e828506f47d985ca18d41701d8e53b9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.13"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f0e90ee3177aa9e559abb550bc647c383042bf3f8d1e90b4ced7f7adca417b5d"
    sha256 cellar: :any_skip_relocation, ventura:      "c05ed9f6a4f3d2b980b9ffdded4911bda4c20a11c07c829f1a1b7a9de254c6b2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f1fde462b78acc56e4f6fb03384c5c72cee596c183187176a4b872ffc16f5796"
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
