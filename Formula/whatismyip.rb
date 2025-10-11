class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://codeberg.org/PurpleBooth/whatismyip"
  url "https://codeberg.org/PurpleBooth/whatismyip/archive/v0.15.18.tar.gz"
  sha256 "ad8bb7ec9ae542b989799eaa7c3519492653df83360c56874c036600ca0e6738"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.15.18"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e162fc4a4bb400c94bda97482e1b2e16b1c790e26161b58386ba66a7c1a9e69d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b74c48680bea0887b188c045bc25c9f9b70c37d68082b73ab611040980372a67"
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
