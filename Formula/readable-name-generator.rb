class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.0.4.tar.gz"
  sha256 "9ca6afec44652c2ad8dd4185a08d39327f0037028fe98665b447af9f97c914ca"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.0.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f65a804c41ab1c2ad49d4da34fb1e5314d6d7cd9b74800dbcf9282b6afb6324d"
    sha256 cellar: :any_skip_relocation, ventura:      "0f85f65f02ab222189e2938714d204bbf6dfb2c1264d2ad37fb6c44c18b6ca4c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8b5fe93657c08148bd73d0506762c08d69dbafebb159ec61ff4235e0c8235eb0"
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
