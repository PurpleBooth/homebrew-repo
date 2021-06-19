class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.7.0.tar.gz"
  sha256 "aa52e3758859f4778f9bb80aef96bf2ff838d76d98d034268cf46c9b5bcb1fd6"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.7.0"
    sha256 cellar: :any_skip_relocation, catalina:     "bfbcee0f21a015df31b101ad86da33974e21c33f2f93214abbf6f76ac4c25f5f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4273040ef5dff17508bd4abf7cb952b578d591d308e318e8e003fec770317ff7"
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
