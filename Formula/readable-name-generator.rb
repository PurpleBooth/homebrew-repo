class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.21.tar.gz"
  sha256 "d8a567a33d79464afa5f1eb757a59407f65964c82cb8c3671f0c2b9bf5966f01"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.21"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "690f93c51a7967544099c0b2391bd4739e939b2e6451b334b15875f343a85cf1"
    sha256 cellar: :any_skip_relocation, ventura:       "4ed75440179d3c9e9585f5105ffd3c70aa2b60896443bb1fe0edcbb149ff339e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "cb0bc12084bc8f331ddf2536016175a2acc1ecb81478bfd9c5483b464ee1ad62"
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
