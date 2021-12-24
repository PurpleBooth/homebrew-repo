class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.27.tar.gz"
  sha256 "0f402ec8ee912ba7793ac5e253850a6303fe1635bdf46ba62ee3255d4e23fde9"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.27"
    sha256 cellar: :any_skip_relocation, big_sur:      "ddf309b9cd2607a3e70dc647eeedc8adbff7c35c68e2f54f2df37f16ab7236b0"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "aa6f098d032598ebae5269a53e1c46c3df0aed1c87d6de3468ac54dbc2e21d75"
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
