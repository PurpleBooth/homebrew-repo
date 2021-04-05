class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "0cecc2c4836a7050d7a0ae791c31cf5250b50ed2f91a667eb7dc664714bfc988"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.2"
    sha256 cellar: :any_skip_relocation, catalina:     "9a21e803c9404f09add8416f443f913d0ad5bdcb3d6bf453fbbb7c3f4a0fcd66"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "682edef51878838234e3a11eceb6938499177f1a135201d75af635824523d661"
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
