class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://codeberg.org/PurpleBooth/readable-name-generator"
  url "https://codeberg.org/PurpleBooth/readable-name-generator/archive/main.tar.gz"
  version "4.1.52"
  sha256 "76740fee3a4475c35ca4b7b9ad4e561884c34b5b0979939086af1d3dc20138de"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.52"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6cc8b6a115cc6bc8f1062ce66e61bd279e2f84613f68202dd002a91e257ba854"
    sha256 cellar: :any_skip_relocation, ventura:       "2b8e59efe70cf2b9718e497558fbbf7f482c259648a7c92de1407503aaa756ba"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3a899c74b41d706c13551aa2ef4b750f8df28b7363459d4400865b6cef88687e"
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
