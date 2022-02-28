class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.39.tar.gz"
  sha256 "bf91a3703b3e86685ecdfd2842fdd0a0aa2b3b04013bd19835744bc521e0834b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.39"
    sha256 cellar: :any_skip_relocation, big_sur:      "01a2cd7fa38e501234f9ae27eea684d5646f2a334f50a05f01ecade22a5c2415"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d98ed1c3ebd90c6acccb43658435366dcbdf75cccaecd2e271f0c54937b59ca0"
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
