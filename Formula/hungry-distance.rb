class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.34.tar.gz"
  sha256 "7a65053d0a51fd27ecbd38f021a9b51d4b5b8998e13af99af5cf0ed9ff96bf4c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.34"
    sha256 cellar: :any_skip_relocation, big_sur:      "8e66b81a6fc45f61ed3c5477e7ffdf726e239e8715fc0b5513c3895d3a59908c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "83866ffab9fcbf3fed503e30ad0529ddf7c047d113069141de5bbd6c7218ddcc"
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
