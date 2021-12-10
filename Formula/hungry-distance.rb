class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.12.tar.gz"
  sha256 "439c1e1e992f1ce17905cdc6d004cf3fcebd83eb1180ac60e06a8c9759cad6be"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.12"
    sha256 cellar: :any_skip_relocation, catalina:     "d071243706a61aaa5ece450076b03d8bfee5e30949a9f84a34953a234b450d13"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "537d560496063f741b13fbc395e55be1eab8e37ac2bec2995919e8b4206d9bc0"
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
