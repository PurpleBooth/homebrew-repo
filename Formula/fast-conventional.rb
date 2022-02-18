class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.12.tar.gz"
  sha256 "52d7885a424b5e09399ee0b36868a41fbfbef10242c9baa9fa7dde0209ef1b49"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.12"
    sha256 cellar: :any_skip_relocation, big_sur:      "4ff5a06f67b3d74e1af2996ed5fd1d54a3bc6623faddcd0eee9ae387f7489ab7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7e0054c9c7fbdf0851549c8a704b6d782197e22aa6f66236fa6662aa6f9ffbf8"
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
