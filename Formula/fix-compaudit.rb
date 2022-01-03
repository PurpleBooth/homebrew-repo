class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.46.68.tar.gz"
  sha256 "f83a44c3e1b2af4aca0c27fdb1ae8fd226fbd457fb74fd9baf46508a2fb0d589"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.68"
    sha256 cellar: :any_skip_relocation, big_sur:      "18226e1c3f31a9942e421a2854dd9112644efc254592f63bc0c2e6dc697d605a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "64a531f904fbf485b97a3aa43271640d83f8eca2f3fe4be959e17c7b1034ad67"
  end

  depends_on "rust" => :build
  depends_on "zsh"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fix-compaudit", "-h"
    system "#{bin}/fix-compaudit", "-V"
  end
end
