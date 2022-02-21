class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.13.tar.gz"
  sha256 "34a0ce135d3edd5e2b20ffc734767793ae944ac4f00ec5711f22d21d39f2549f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.13"
    sha256 cellar: :any_skip_relocation, big_sur:      "731b2a36a6f1c9f5b6759e8dc321218c410d6381eb613c20dbb40aa84f335f70"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b36db21d5ecd770400002b9d374ddc5090cb636cdccbe56ceec6cd3d7d08779d"
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
