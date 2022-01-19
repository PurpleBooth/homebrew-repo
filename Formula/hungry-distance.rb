class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.21.tar.gz"
  sha256 "efa45ea20a4b3d2d9db58742fcc07ea9ded0e1f059f5fffa333f5e2f138c4501"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.21"
    sha256 cellar: :any_skip_relocation, big_sur:      "eb29bea007c84a6875817713f56fa868604e9f517a97aed642c6813a8a973c33"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "39fc7bc98c932937688bc8b3194ec07f8e0706d3f1d85857eb20cf6ec442cf11"
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
