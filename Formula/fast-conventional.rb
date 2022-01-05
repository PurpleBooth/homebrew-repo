class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.5.tar.gz"
  sha256 "97c2f7b52cf8cbe47ab9db3ba5aa7589d70341e9973a76851bd8e1cb69ab7f8b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.5"
    sha256 cellar: :any_skip_relocation, big_sur:      "deba3f5c4f7014d377902f5cee62b514882f6a5c102640d5ec21936dfb8ad8ec"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "07863e7ba08bbe5102c4c5038146564618c532f142bcd057522b8d6c59d463ae"
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
