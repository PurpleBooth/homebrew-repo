class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.23.tar.gz"
  sha256 "2f030acd61a598d6e5e0253519629cb0045f8746c64661e529a41807dd0f9057"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.23"
    sha256 cellar: :any_skip_relocation, big_sur:      "c6d0cb27a710bca77f5587c1762bb36d63603142af9e0708e4bb03b567948693"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a279bf09ba1dec5ebc557193e081336f238023733757c50f6dc702f2f6258dc3"
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
