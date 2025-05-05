class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.56"
  sha256 "0497e0921e4b530af842d510b2a9c6a0cc19db71ee8ab5d5333e880f39408163"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.56"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "52a4dfa74b7dd4ce1e6d523986cd48ea00a8c939c12e8c6758c36d16db3ae23f"
    sha256 cellar: :any_skip_relocation, ventura:       "49f469a6afc32f9228de09665ddd0665088771604c90b28cbf3403426820c2e0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "dc7f5915cad72fe9bdbe9611afec5f27949993fde9211f9f71ff7d9d0935ed83"
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
