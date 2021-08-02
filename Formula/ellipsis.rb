class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.6.tar.gz"
  sha256 "52fbc6fabe5b08dcd20281addf05bb5fd00cdc615f241dd60b11afc64f9155ff"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.6"
    sha256 cellar: :any_skip_relocation, catalina:     "8e926cba987657397256028b849962e94f773a07ca96e5a2f9a94e883bdf8800"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ed0faf1e2aec6b18a448736a68c9a34fa3aa6288e9a21698e0b041f82c2bfb23"
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
