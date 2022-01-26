class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.10.tar.gz"
  sha256 "825dffc63f061a3728d8148464bd15f70ecada6c77a2c8faecbfff574cbd2249"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.10"
    sha256 cellar: :any_skip_relocation, big_sur:      "042dfe48d6cde1d787a3eea708e3153e5dc1ce1219ca1d3830a77a26ad2aef3f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2da4da1157d6e3f3467f480f7dfbc7520211e5d187b7fd335c2b2e8b845ce8a3"
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
