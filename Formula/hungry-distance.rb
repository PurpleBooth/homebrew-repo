class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.29.tar.gz"
  sha256 "2ae08046d83acdaa2d64fbd545f787928c77ddc2d4c5454321d7eaae2a328e97"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.29"
    sha256 cellar: :any_skip_relocation, big_sur:      "b45eb941958f4efea164ea029b730164d6a599ac6a6d9104cb299f87cb586b6c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ac8b6dbd651581a9a1032718769456590a143cac063efac6aad4cbfd2b7bbbdc"
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
