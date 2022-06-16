class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.33.tar.gz"
  sha256 "92227c1e94e142c93a103324fc188361dd33f3999492ece06d515105913513fe"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.33"
    sha256 cellar: :any_skip_relocation, big_sur:      "1e20f9c6ad5fe42826b6ec4878980084fedc15a77bb6bb331b90e310ae3aa847"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0a7c6a6079098db30fd1586771e5c25f62c234e692c59c71f5357d9537b7943d"
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
