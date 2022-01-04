class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.3.tar.gz"
  sha256 "36901a82cee4f21a29ab4a8279bb1358a06cef49b49110970d7eb84d5fc058f1"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.3"
    sha256 cellar: :any_skip_relocation, big_sur:      "c9bd048ec9a946dbc1099f61b63e5d488e908a2be16169cadbb168aa29e01ce9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "58897c14f295fe3f5e05cef47c791b29c3017e2c49e2257925234c66627bcd92"
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
