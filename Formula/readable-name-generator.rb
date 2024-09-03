class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.9.tar.gz"
  sha256 "6f8e7709f7437ab5e969d570d4acf540a728694e6951249f0ab92d9f0cad1825"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "151001e727537d11406cc424894965275b3012b11008fbbbc9b80b643779db91"
    sha256 cellar: :any_skip_relocation, ventura:      "245a3e24d785ff10d48b02780e7496fa9ff4c581fbf0aa90c37bfce783659591"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9fbad9ed9214b27f96be29646650d2b5128eac5ea770a188790290ebf1ec0068"
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
