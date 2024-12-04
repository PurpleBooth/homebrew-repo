class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v4.1.20.tar.gz"
  sha256 "5adf0bcd72a5fa6fe6e926f5d4643fa24b589b7dbd41d0a7d0424a39ede3cb59"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-4.1.20"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7f163836c42ca75a57f984351168b2e1ea0a18ccdc520ea1a06ebb8eff35707e"
    sha256 cellar: :any_skip_relocation, ventura:       "4e1bc1d214a4533496628fa4122916995b9f1fedac88ac7cd1cf143200c42d05"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "83bfaf05e9dd6595fe29cb12b520ee04c4a29094946dd7d595fd7afff6adfaee"
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
