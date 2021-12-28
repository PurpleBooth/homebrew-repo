class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.14.tar.gz"
  sha256 "32ee142e2fe12004709d500126bf231b03c73c2b6937c03f3b3d21ecc23bdcc2"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.14"
    sha256 cellar: :any_skip_relocation, big_sur:      "91ad9197f881a392c937bbe956fbd54199c986b02812f74a7cedc33db848a96f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e50b1188f7c6b44499e69b3206d2f812478a821355c1c2cd2782ae6e60f770fd"
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
