class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.54"
  sha256 "180eaf709cede226a2ca3062bcfcdec49824b3e7e82708afdbbc842d3e886a7d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.54"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5c98849a225d133569bd40a9817568e0a76803f24ca83e7473fae7a2862f203c"
    sha256 cellar: :any_skip_relocation, ventura:       "b34cd51e259216db77376935b88c337789165c5ac6881f907501d39f49095a6f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2450dc3978c74ac83524d431741625c7d57d2eb9fe1d94b55057adc12ad9e70f"
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
