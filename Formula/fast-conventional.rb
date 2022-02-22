class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.14.tar.gz"
  sha256 "57f87e53c8a154afbd92a045e01d2cc727ba92c5bd457cbb7189e2c2b637c7d4"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.14"
    sha256 cellar: :any_skip_relocation, big_sur:      "af0e4a791e67b4bac86b81bc941eca516786c9738b0f0406c9e005cd88d64374"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0fad7c7f01616034d6be65e8735698a1d9e05ea7c3be50ee6ebdaba51a891936"
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
