class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.2.tar.gz"
  sha256 "0b42519eacf08d8b86080e6432a526325bf7067d0cacd43a4b3dd86426dee204"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "9321607ff07618cdf6cc042e8c6d5e1ef0a577d04bfc40d49233410a5892e0c2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a0925b2bb2ec3fdc0ea258d5a88218107518ca39aeb38c64c5296a765de1f969"
  end

  depends_on "rust" => :build
  depends_on "socat" => :test
  depends_on "specdown/repo/specdown" => :test

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fast-conventional", "-h"
    system "#{bin}/fast-conventional", "-V"
    system "specdown run --temporary-workspace-dir --add-path \"#{bin}\" \"#{prefix}\/README.md\""
  end
end
