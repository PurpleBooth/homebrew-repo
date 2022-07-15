class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.36.tar.gz"
  sha256 "2552f8337e931ffab40eaa7564b8bf5fb692ebd0e261d29bccdde49ae7810862"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.36"
    sha256 cellar: :any_skip_relocation, big_sur:      "a2a84686734186f482d28cc9c1056117b496ba9539bebb5a136d97f9614f8e48"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "643259daeee1ad3af05ab16d6b6a394e1d008b7f0eb1406a9f4ab66e7760f7ad"
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
