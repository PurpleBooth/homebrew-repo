class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.101.1.tar.gz"
  sha256 "1851116448928ec75e8d18b087163aee14e8a4956e2d5ef7567bbac9dce873b5"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.101.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "dd75ff4f282c532a58353a5b9e7429c479e967d44bb24df07b7a93a83cb59d00"
    sha256 cellar: :any_skip_relocation, ventura:      "91a32afe1cded99aa1851087d876d5a5afd54daa2fa44cb07804401ebaf2211e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "73f84acd6b35a75581054a01ce25ac2509cc0e2dd78837ea4c4aa9a87efd9811"
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
