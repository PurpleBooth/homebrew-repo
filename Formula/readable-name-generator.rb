class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.0.0.tar.gz"
  sha256 "5c2ec0192f0b99d710510f5b93c78a3dc469aed3c486d1cb4144394588c63946"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ccd5339884f7488dfb224047d0660f8741b7faa39256d33cd956c659a901839f"
    sha256 cellar: :any_skip_relocation, ventura:      "244b65305a7ed4ee6d9bb983b49210c97e266b9b850ed9b6a24df6907aa37c32"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "37443bf8d95d25380f4f5ec3a8361c6c0b161ebbd5c075cf7fa6f04beda93180"
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
