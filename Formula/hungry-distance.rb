class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "73e6d906366b284782de77eee02d7601f8f992959de9e22c2d5b59b1aab04e87"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.4"
    sha256 cellar: :any_skip_relocation, catalina:     "71b41ff4f0e892452f29033dc2b57f27f4ab3d42200252a9c4115fecfc928cc8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6a9caaeede7605f7217a38a8457d15879405e25137c1a024183b21f44dcca7bc"
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
