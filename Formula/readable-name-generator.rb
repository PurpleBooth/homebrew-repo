class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.0.tar.gz"
  sha256 "ee48c9e29cd90639b4ea45420c1ee49fc0a9448189637d408d87179b0c07ee0b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a4bb7d0df52f8aa6d120080e3e54ebe19b3618daa24fa6a80f783c441e46c4e5"
    sha256 cellar: :any_skip_relocation, ventura:      "dbb41f8c1a4a596e41fd5ec8d2f01c7ba410c29924b0e71b46dd0b113f52f32a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "13eacb59ac6cef2097d4f426f653788633c63a24337d9b5d885499877206c86d"
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
