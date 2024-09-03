class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.11.tar.gz"
  sha256 "345238535a45e5134aeeb937f5a66fbdf13a212340d02672cad68473405b57fa"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.11"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "abd57dbd8b4fecef8a6887ed21ffd0544b863527b923c699220f71639191ebb8"
    sha256 cellar: :any_skip_relocation, ventura:      "b68a21bcf71f628525df21fef556e1cdda47746eff0f8c738dd7bdc4d67a68a0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "55159efdb46a8743fb33b83da2daae3b29c43936b50ec283f4c1f55eb6de7757"
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
