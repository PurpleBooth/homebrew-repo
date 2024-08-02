class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.10.42.tar.gz"
  sha256 "539be954bce2b4f3c287c075c069cd5b58c4270392ea31ef13ec62d8038dcc47"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.10.1"
    sha256 cellar: :any_skip_relocation, big_sur:      "be138bd5b4d3b2ee49a84128151a83dd660626aa16a7e5f262f07cd9a6532ec3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6080d4abc11721cf67bca8a79f386a98058f102c3c1ce5e81c3ac4d06610a5fc"
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
