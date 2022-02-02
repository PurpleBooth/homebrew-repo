class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.36.tar.gz"
  sha256 "4552951c1a3109b7d3ec7a7724a3611df1a99ff99d342631b8860e08b2e75c46"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.36"
    sha256 cellar: :any_skip_relocation, big_sur:      "5160869adb76003971c35e7811d87394d8ac4d418a586252ec025303f970ecde"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ba789e28bc765ac6751aed426fb712cf8064b720d59fae51efcc7db30d56e329"
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
