class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.30"
  sha256 "a9dc00f63e5a0613dc3acca7a960430cf4f5015c6e30592c8fe627d2e59e92e3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.30"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "045f77f990c661d9cef80924dab70c04db37cee59acfbb0144e72de50fd506a3"
    sha256 cellar: :any_skip_relocation, ventura:       "ba38bbf393714c07db3bc8cc88ee074a0b7fde8521b5be12b2dd1964bc5a9271"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e1700cb95205b0e0a2c1f1e40d23049f36acfc6e21640790f1da39583daf749d"
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
