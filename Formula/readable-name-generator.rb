class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/v2.100.24.tar.gz"
  sha256 "7e72ae6ae129775c7a4e5681c768b49670e7445f8c330499d556cc076e7242b3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.100.24"
    sha256 cellar: :any_skip_relocation, big_sur:      "03a0f8e29bdb1885566f5c0916f192de9ad34b2fb93b6802dd9e2e9b5bf85674"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8677ac76382d4c63d8f34b2dda1e45ccd8db07b0be3afb99b25a5d75f47d1e54"
  end
  depends_on "help2man" => :build
  depends_on "rust" => :build
  depends_on "specdown/repo/specdown" => :test

  def install
    # Build binary
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."

    # Completions
    output = Utils.safe_popen_read("#{bin}/readable-name-generator", "--completion", "bash")
    (bash_completion/"readable-name-generator").write output
    output = Utils.safe_popen_read("#{bin}/readable-name-generator", "--completion", "zsh")
    (zsh_completion/"_readable-name-generator").write output
    output = Utils.safe_popen_read("#{bin}/readable-name-generator", "--completion", "fish")
    (fish_completion/"readable-name-generator.fish").write output

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
