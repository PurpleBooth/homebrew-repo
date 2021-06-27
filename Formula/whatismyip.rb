class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.1.tar.gz"
  sha256 "7b08c09e9ecc8c429667cd4f9efb25db9111fbdd3569874d7143ffadb557c278"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.1"
    sha256 cellar: :any_skip_relocation, catalina:     "41bf9367fd861bf92b719c22725767aad6a1e2b6e897afc42ef408ad10953e58"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "147a50f7732ce401f1a6dbf0e853d966a52cb4942470cf821d1cf4dde14416cb"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/whatismyip", "-h"
    system "#{bin}/whatismyip", "-V"
  end
end
