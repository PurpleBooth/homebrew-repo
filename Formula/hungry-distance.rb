class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.32.tar.gz"
  sha256 "38e917e887980b033f6c1bbc53ae95aa8d6dc1e275acb047d786661050184f8d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.32"
    sha256 cellar: :any_skip_relocation, big_sur:      "d8882aa27678bb5e87e6644bc65503d73f66111487b84ef86d21dd64ffe091b4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "566bb57a59358b418cd545bdd015fd1080b2432fd59ed64d1331fc2d9b070589"
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
