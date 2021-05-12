class FixGnupgPermissions < Formula
  desc "Fixes permissions problems on the gnupg directory"
  homepage "https://github.com/PurpleBooth/fix-gnupg-permissions"
  url "https://github.com/PurpleBooth/fix-gnupg-permissions/archive/refs/tags/v0.49.32.tar.gz"
  sha256 "752a5ef55d0e1cea71d9c6237688abe7019dc9293d3c829f34d6096b7529ae66"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-gnupg-permissions-0.49.32"
    sha256 cellar: :any_skip_relocation, catalina:     "eff7a7d369aa3d744d527a952d2ffc183712d93f627547ccdbaaa3573b5b251e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "91cd02ef3179d77e923624613e01b6abcf23b428f7d4680c8deae380fecc9673"
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
