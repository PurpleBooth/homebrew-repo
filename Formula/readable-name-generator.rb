class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.101.4.tar.gz"
  sha256 "849056a32a97bfa001b3a1f777942690f324c6ff978675cbaf68d8d5aa421d9e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.101.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "82fb9c21091fd1140a0b1cb7eb267b2c34fe7cf85862eb5ab24de91874066d7b"
    sha256 cellar: :any_skip_relocation, ventura:      "ec97db44cc35b28bd8d6c492e64b5062e2cf43131c1ea1ca9ef8b663efbcf9c6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fa2d21f6fe12c2d62bdafb441385183ac3ed35418cf22a0700fa4f0776514de3"
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
