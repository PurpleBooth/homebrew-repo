class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.0.5.tar.gz"
  sha256 "a55cdbaf897012ad7f2b0dc708ec0bad475cd61491bbff28c5f138c8d5af62ab"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.0.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "1ea52cbe378c8efa3db6a608162c5124c934f48a6d7b9ac6cce02a434122308a"
    sha256 cellar: :any_skip_relocation, ventura:      "7f08308a1ce71424a44d6eb45f46398fb8ea1c3ecbd4c22df3e7ead46e26ea7a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c36fe2aa0ae3cede3e064edd8bb9c6c96b975a9e6c71d74f5b773c4a0f9d4e5e"
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
