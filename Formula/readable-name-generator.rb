class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.6.tar.gz"
  sha256 "165860058b6c83b1d9340eeda0b275feab923f8d62ddc834efe40b7c5d57eddf"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d782d383c5958e850e47423469085ee1f76290aaffa8eb59a8a3a52a6db66c48"
    sha256 cellar: :any_skip_relocation, ventura:      "f0fd530cd858571896bd01a5d45710120aa6906f76b17fc90cab93c5bf4631b1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1cbd594e3b21b4d133eb4d9dd1ddcb98f4b0ae0388ec9b84cec0e755ef68f265"
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
