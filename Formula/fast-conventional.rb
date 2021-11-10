class FastConventional < Formula
  desc "Fill in conventional commit messages quickly"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v0.1.4.tar.gz"
  sha256 "548ad56cfd5782fb51ee1213eb1f829e92a0e28bc701fd095e7e91e298bd529d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-0.1.4"
    sha256 cellar: :any_skip_relocation, catalina:     "7379e98b36c1456781ee6713dd478a9d3683b3b64e0342d50ca53971b054592a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5fef407337f7b0b882524c7599601907764826d0148ea4ad2260684e56fb0f3c"
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
