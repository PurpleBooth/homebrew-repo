class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.13.tar.gz"
  sha256 "bdb49a0a3c5b188bcfe9aacc22d6e1e6b42f25333ddd9ef88e350ff2f62ea4e6"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.13"
    sha256 cellar: :any_skip_relocation, big_sur:      "0e83e012553b5636ff18bb9372728642f97ce984a35a6bf307682ea7e88f2009"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e596bfa68afd1acd3d9f5c9d8d13619b5803433b866d7b7884e185b782b28c66"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/hungry-distance", "-h"
    system "#{bin}/hungry-distance", "-V"
    system "#{bin}/hungry-distance", "--", "-11.46875", "39.78125", "22.78125", "73.875", "-3.5625", "-52.625"
  end
end
