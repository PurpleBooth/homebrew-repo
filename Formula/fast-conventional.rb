class FastConventional < Formula
  desc "Fill in conventional commit messages quickly"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v0.1.3.tar.gz"
  sha256 "9ac5c1578cd4804d2d0c0c2753685cdfeaa877fcdf4ef98b3c81291d6ef8e449"

  depends_on "rust" => :build
  depends_on "specdown/repo/specdown" => :test
  depends_on "socat" => :test

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fast-conventional", "-h"
    system "#{bin}/fast-conventional", "-V"
    system "specdown run --temporary-workspace-dir --add-path \"#{bin}\" \"#{prefix}\/README.md\""
  end
end
