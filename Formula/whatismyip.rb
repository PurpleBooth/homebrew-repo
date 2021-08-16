class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.9.tar.gz"
  sha256 "b715d7dace23c27ffa08dbd4dc33d3b13157e645db0fc2bf4c45d4e95c713c51"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.9"
    sha256 cellar: :any_skip_relocation, catalina:     "cb8c6ac6ffa1b3d18dcbf3c2471bac9aef000e8521e81870e0d9d7a6ec1488fd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1a41fcb6fbff6aedc8b1fca1ee0a1bc4efc23f9898a4ed4e8441b8b8c2216b9f"
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
