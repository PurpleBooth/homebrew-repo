class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.101.2.tar.gz"
  sha256 "e3cfdfcfe6822c12f59cc002e52d6963693ee23239d18c58a2bd93950c0d8b20"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.101.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "96c5058749906028edea25b896439d687243fa51f49ddfde28743cbbd28944b5"
    sha256 cellar: :any_skip_relocation, ventura:      "694257c7573b218eb50bd6c79d29b08b0b4c65ba44ab1b55c25aaa7a71479c52"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fe1b59e9e811775f84a914da370a1f24ad38de46cd2c41bdaf3d0ada0b78dda8"
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
