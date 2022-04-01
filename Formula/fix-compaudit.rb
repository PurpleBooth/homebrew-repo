class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.46.78.tar.gz"
  sha256 "a09cf3d4038b54cc5603aa3f5ea913609bc8d9c0fda1734d70f03b427d01e883"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.78"
    sha256 cellar: :any_skip_relocation, big_sur:      "a1b919adff3bca05893193dd2b9253dd9862f0a9215dd02d7a24e0500ad16098"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6fd5b8c0a59ec2c8ad311433d0f9915e660ede14ba4161d12dca255f6f4dedeb"
  end

  depends_on "rust" => :build
  depends_on "zsh"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fix-compaudit", "-h"
    system "#{bin}/fix-compaudit", "-V"
  end
end
