class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.71"
  sha256 "fdee12eddb4f20e6da9d4d6ae800f942758ffe9e21d5c45348946beeb0dff6ae"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.71"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e552e8a48758836e76c76e4d0edd60784d65715146114b4b2e2d46402869a399"
    sha256 cellar: :any_skip_relocation, ventura:       "de27c5ed0432e1934dfe1432c2509e6458c889d61ebe46272d6db02c8786e1d2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "93e79503806464b305f7ed2971a9e2ddc773ade614ed590288c2a4511573b343"
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
