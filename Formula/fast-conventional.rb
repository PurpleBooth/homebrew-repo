class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.1.tar.gz"
  sha256 "a5b5709aa599012c4cd3734871301d905b89c4dd513067733be2615fe5c05a28"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.1"
    sha256 cellar: :any_skip_relocation, catalina:     "b3f5f2dac9340f8b32852056d41b31e256bdbc2254eb4b06ac56e870c19222a0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "dcb1304f24de79f98df24295ad059822abb999913e7e8d0f89ead91ab238ef18"
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
