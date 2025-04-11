class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.51"
  sha256 "d8839139b035d437a044797552550c73b8f6a7457210179fc8078b9731cb4ee5"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.51"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "700d2f54eeb03e1019dc18897ad9e43f479e44636dd40d9dcb23b294e9ca970d"
    sha256 cellar: :any_skip_relocation, ventura:       "619706230698518b94a6a353d436789de383c17668e07e3720c151231bcb36a7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2e106ac9bf14297f28ba430dc5df642e198bdec8fbd37cb3846f28ce646b9445"
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
