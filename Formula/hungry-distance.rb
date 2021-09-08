class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.9.tar.gz"
  sha256 "1e2a58744768dafebfc100c939076cbee2e20560e133f81fc30e86ae9d05f582"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.9"
    sha256 cellar: :any_skip_relocation, catalina:     "7b28e4006fdff9cda9b783651cfca39ce70281bba194479e4043ec0a470efa6e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "957f4c63f4a1ace1efe6a0b253714bdae265ddcab54e3593ea8ac3ed0d677beb"
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
