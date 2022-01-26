class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.9.tar.gz"
  sha256 "092ad42105681e4100fb675b2e7eb9da9cc7aa0562e5e7c248bde0924e93cc81"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.9"
    sha256 cellar: :any_skip_relocation, big_sur:      "8555a874f0d067a4ba6f10b4d99586968e9e0c6303ce88b746c6459529fb40f7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b3da14b330726240539cdf62a456c286e45b9836f1f03ce8b70a0046ea2d9ed0"
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
