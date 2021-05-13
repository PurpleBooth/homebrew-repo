class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/refs/tags/v0.5.3.tar.gz"
  sha256 "9ff54dab386036b1fc5af597f5e95b4e567870adb308806e53b1d71d4766ce25"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.5.3"
    sha256 cellar: :any_skip_relocation, catalina:     "1895dd074319c0cc03922f50e2c18fcc470c4a03c613bc5d48c6ab33fd364772"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "af57d46517cb21f09e093c39b4e36a3798aea5e94d7adf8195f9a4b8833f8283"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ellipsis", "-h"
    system "#{bin}/ellipsis", "-V"
  end
end
