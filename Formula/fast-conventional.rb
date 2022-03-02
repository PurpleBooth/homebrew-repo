class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v1.0.16.tar.gz"
  sha256 "8c8fe2883bb5a297c3950646a28f59ffa846489ac60c8cd7912773fd7384ffa7"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-1.0.16"
    sha256 cellar: :any_skip_relocation, big_sur:      "0e1ea74318b3f2fcd1979009a8ffdba98fd6e7ae427772cc11dff7f23e2d175b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3107a8a3697d845404e472290ba210a476712471963ef02b2aa699cf1265d11a"
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
