class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.17.tar.gz"
  sha256 "d61895405484678efacbfebd9819cea35944b83ca4930bde0a7ca4c1aebdd1c0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.17"
    sha256 cellar: :any_skip_relocation, big_sur:      "145095b14b867beaa7e4718f4e3ca67f9646e202b0ed99d02d0d7de39da8dff4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8a8801994164bfeab93bf81ceede7083c9bdf0e796cbf26f2ea4d68d7b7f14c8"
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
