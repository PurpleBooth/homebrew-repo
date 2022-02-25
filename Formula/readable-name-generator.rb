class ReadableNameGenerator < Formula
  desc "Generate a readable names suitable for infrastructure"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/v2.100.16.tar.gz"
  sha256 "dd00a00494f6de1801868a172b5aebd77b4de7cbe5aef93b77adc3b79b707538"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.100.16"
    sha256 cellar: :any_skip_relocation, big_sur:      "ddc258e3e97d38fe65f301a6292ad1e8656ab64a3882edea21b4d26f74e1be2d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "df326d6382730fa470332ccdb6f3d10e0b1de48217f1a69a610e1bb4bedeaf3c"
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
