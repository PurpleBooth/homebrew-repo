class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.0.6.tar.gz"
  sha256 "83b5356b06568449c3e881c8ebf235ba1817cd853f386324f60ca4836953d68d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.0.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e2dc4d0ae869c92c35fd180d424457bf002331b1e6a95f79f912c870083fab54"
    sha256 cellar: :any_skip_relocation, ventura:      "b1022af865ee2401ef276d4a222e62f1ae6473b9a7582a758173fcbe582e067d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e46723033155544173f36b9774726baa581ccfff3aa99dc49eae5fa2db310148"
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
