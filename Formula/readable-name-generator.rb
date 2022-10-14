class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/v2.100.44.tar.gz"
  sha256 "a8c088112ed12145daf2fe2e2e413486d513d44e84893d91fa64d75e544bc266"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.100.44"
    sha256 cellar: :any_skip_relocation, big_sur:      "36e87d3a65501127d04f6e48ef2819107d101f7388df54f75708cbbcd69abfb7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7cfff5433328659f5c2e2acc4f2320d5f5d4d6fe8ccf47f9cc62743a7f13b4c0"
  end
  depends_on "help2man" => :build
  depends_on "rust" => :build
  depends_on "specdown/repo/specdown" => :test

  def install
    # Build binary
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."

    # Completions
    generate_completions_from_executable(bin/"readable-name-generator", "--completion", shells: [:bash, :zsh, :fish])

    # Man pages
    output = Utils.safe_popen_read("help2man", "#{bin}/readable-name-generator")
    (man1/"readable-name-generator.1").write output
  end

  test do
    system "#{bin}/readable-name-generator", "-h"
    system "#{bin}/readable-name-generator", "-V"
    system "specdown run --temporary-workspace-dir --add-path \"#{bin}\" \"#{prefix}\/README.md\""
  end
end
