class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.11.tar.gz"
  sha256 "7f05fbc208cde57ae78c6877be37ec3bc876f0875ba3ef83782be0ae23360acf"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.11"
    sha256 cellar: :any_skip_relocation, big_sur:      "d105fbea5e804b72005f4f22ce9ae32343a4bdeaf47611e226ee3ca5663c9b14"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "613b0ff0ebdbcdc74dc34d288fea5c465b7f673059ef61b90de3d512a0b27ee4"
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
