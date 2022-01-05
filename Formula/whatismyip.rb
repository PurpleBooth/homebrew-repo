class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.30.tar.gz"
  sha256 "cd22ca40f3d9b8044ce74375e646e4efade6fb4faa31661ffa569409f4fc265f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.30"
    sha256 cellar: :any_skip_relocation, big_sur:      "6adb563097b555725a892b1bd482247489d76de5ad27b9dc6bf19e608311414a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "517a4215ffe4ec50a59d6f6f3316009c0b22fc9b50ed5c42d66904e66373e1d1"
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
