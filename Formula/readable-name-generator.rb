class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.0.2.tar.gz"
  sha256 "0c6108735806ab6fe16b92175d483816a4b133f93040763144560945fedd657a"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.0.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "11a4319ffcec6837eee26bd7111f2978615dd1291266a2205bfa9eaf9ddac097"
    sha256 cellar: :any_skip_relocation, ventura:      "dbfd74357cb1696f65c05b54aeb2cc53c7c444afd25b92048fef105556c61903"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "56864a9656a1ad6998a44bf469c0062edef9531c2b8b3b4a8b7a3c16f2e8aea7"
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
