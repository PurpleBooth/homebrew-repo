class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.18.tar.gz"
  sha256 "b27dc996c91f577ed394e7c33fd661b6448b256a7c64ffa182ce4b3b4d3019c5"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.18"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3b9c7f82f64bdeb451ff8f1f60a9b50c585ec1a2222a16ba68c37100cc789b42"
    sha256 cellar: :any_skip_relocation, ventura:       "5172e4073e88f8d13f98007f30a90cfb3f48288e36022573e86eaf7bb9bfc86e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2b875426d19441089aa0980bec37bb848b08f14fb5f4f5bb40dec7223c6ace80"
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
