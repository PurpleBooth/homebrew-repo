class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/refs/tags/v0.49.34.tar.gz"
  sha256 "1b0c9114c2ea3ff5bc076cdcdccff67f181d1117c979c1c2a210ba4d32f3cece"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.34"
    sha256 cellar: :any_skip_relocation, catalina:     "020c1a759a7e528e21c6c238045edec827d169521440f8c80d997c09cf14b4ca"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9555aae1bf245855ad91572d381d2d2a190e39321f0ee5bee31b6692ebfbaa14"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fix-gnupg-permissions", "-h"
    system "#{bin}/fix-gnupg-permissions", "-V"
  end
end
