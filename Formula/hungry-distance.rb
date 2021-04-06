class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "6c1411ff2f3e9fccee34138b76bcbb7c057dfcb0a5bf14ee71d0bd4ae84560d5"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.7"
    sha256 cellar: :any_skip_relocation, catalina:     "d40c3ad920c9bb53be0972de0f4ec471427b97712cc5af9439aee60313902ab8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "38af400eec29f7484edb3ef4a4c212eed9340d4157bb8ffeee1dd82fbcccab03"
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
