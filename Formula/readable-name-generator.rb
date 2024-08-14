class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.100.61.tar.gz"
  sha256 "8b652967fe32be648faeb19f14e9e0467a0fbc3e66d87f755ad7c975db145ca1"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.100.61"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f1afbf007d6aae5a6f453f16b7e73fcab7ea019f38024f2cda1beeb6d1812c17"
    sha256 cellar: :any_skip_relocation, ventura:      "acce9f3ba038cec52f103d03861bb1e191c44f84d3374bd0f906ac424e9cd8a5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ac937f01931e7520d80f2b3576875681bad4c8adec63b988a3e69e9e3cd551ba"
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
