class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v3.0.0.tar.gz"
  sha256 "0ed448d1e38c23dd892ade397087260ae42a1c1af6483eed5407f34699c9b7d9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-3.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e1674e324437e7f98b7734e9d2dea6b3c4c47e5f128f1ccdcc16e2d8be95773a"
    sha256 cellar: :any_skip_relocation, ventura:      "99da0f8d0407d0a249a90e23a15bd3890c7f46ce9aedec9996e7cef91004ef7d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d8c5e7ec8a4fe7370c0c8bcb6d5b8cf97ae9105375513a42b5a4089e82f414dd"
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
