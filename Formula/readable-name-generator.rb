class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.0.9.tar.gz"
  sha256 "57696c769c3f52082b130bbf299b2f571400150fc86dae0c400cc816e079ee29"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.0.9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "1c6035d4546b89e4cfb1a33b27dcffdef26fb7ebb798401c613cb1bcf7bbc6af"
    sha256 cellar: :any_skip_relocation, ventura:      "5c880eba37057080ae2d309a0364e40f4694b0c742e7e0ca44a1f92caea7a970"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "15d7ecbb521be156a70a41e9698c35e31292d53ecc3e04b1fe31f7834cdfbea6"
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
