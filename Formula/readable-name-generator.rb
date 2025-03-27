class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.46"
  sha256 "748985834fa978fc49d8a6e604c30b7793c6a6c45ea19ac84b9c8bc60799b733"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.46"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "57572ac83b89002a5bb5be6dbe8f2b4f5ca992bb1f6175feb836f65fd3c123c3"
    sha256 cellar: :any_skip_relocation, ventura:       "bab963320a36790a94c18622375a3119223e0c3431f576c4f0088534f611cae2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "135c679cd409e1d4f05807cf732ee4fd6803e6acf69d96b9f952337756ce537f"
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
