class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.48"
  sha256 "3fdaeb728485fc5ff88e0717defeff573b6578f5bac57e531efad58aaa8e2b4b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.48"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a3a867251e72d53e8e466dc9e7314415e2ea18d25f1532c136e9f402ea1409b2"
    sha256 cellar: :any_skip_relocation, ventura:       "6c57eaea84cb04082c741ccc3b30575b20f7f747002a42cc1711248ef7f0fe28"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "30b255efa5689dc9d372b7d3be1dbca31daef2ff404b5594590ba2463fe6d2d8"
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
