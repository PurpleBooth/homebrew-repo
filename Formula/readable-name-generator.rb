class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.24.tar.gz"
  sha256 "d935b69c4ac7a958d6cc68dc3cff734b159d6f22a2a6b77e477401601c5dc5c4"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.24"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7c3ca83d80091e8699544e34b3e81cc893bed72a7c256955d004418ba5f93658"
    sha256 cellar: :any_skip_relocation, ventura:       "4106de6d583e80f23c1d7fdba7ea7aecdc102e929c848091ac440cc3131fadb4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "36b7d3508e97f69e9246783a735d2dde388a0c7ed2ad2c0d34553c056f3d9969"
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
