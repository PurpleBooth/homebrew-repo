class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.5.tar.gz"
  sha256 "8e016bd3281b2adf0f3cbbc1de598182dc3c676b6a45e72322b9a64e32ae6727"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "86117c15c48bcf04e7c41cfddd7f1f8ada0113e4ab69055794f47194fd04f072"
    sha256 cellar: :any_skip_relocation, ventura:      "8913bbf6dddd4f62756b5f7802fa209514dc6294f2ff0fd3ddcbb4c372cb89ab"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "528f34c07ef9bf225c0bf2b317cce5eb9bf1a967743c07f6c35b0409839ef762"
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
