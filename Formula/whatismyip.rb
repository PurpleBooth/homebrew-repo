class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.10.0.tar.gz"
  sha256 "82269264ed4fef53f4d3d4f683b0c74c922732ccf54b6cc8ed934544f6fa8899"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.10.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "f96997c344d3e3a67e9b2cd56a39e9638b23ec317a95e7e4b2debec100e1152f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0b6ca99c741d4c1d2a459189cc3f7ed09f45ee9c8e9a09793999539e7631a0fa"
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
