class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.60"
  sha256 "d45c26fbf3fb722bc7cfb9d7831a59d0b202bafabf84f9b60eba999eacf0e49f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.60"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8d0802fdb033096e703affabe65e0f0ced3dfaad159b7e6177afa55665f8a515"
    sha256 cellar: :any_skip_relocation, ventura:       "521526b3ba7a8d8c8e67b182bd353ee8865603054e4205b48624ab8f9955160e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "77bd9adaee7491d1797652b26ccb4220333fd39e23e320081fbe8db0daadcca0"
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
