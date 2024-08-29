class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.2.tar.gz"
  sha256 "73f8f4a0c17e495eae6ac90d4f1963f15cda5ae1888b154db27b0ee6a372ef61"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "030e7817b80ea4171e81fb739775e6e70722c96f5d1be9d600a2190a9b15b9f8"
    sha256 cellar: :any_skip_relocation, ventura:      "21c6e50526262e0377c2bcc5aca6a3879436993155344c37b04e7ae6a6943768"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "96a988961eba19915751df185fe5bfc5acc7e29d731033df90c5ba7a79c53b90"
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
