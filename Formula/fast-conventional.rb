class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.7.tar.gz"
  sha256 "cbff3f63633a4389c6f24ce8de5b5d4788e57bb2cc1299482d1201296bb1abaa"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.7"
    sha256 cellar: :any_skip_relocation, big_sur:      "170253e7f11250dd9cc451fcf864b79e525786929c55e935a1d01f95c30bdcc9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "328b4c710425a02033633da56ae02c75051cd346e7eb4676692ace110f5c2804"
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
