class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.25.tar.gz"
  sha256 "b45a2389477af18067705ce8e0aa5901d364713e5a80f1906db8e6ab1f22d804"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.25"
    sha256 cellar: :any_skip_relocation, big_sur:      "76261e285452415c0c74dc61a2da25137725b1a8dd441abac7ce1d7b4faf5822"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1d70939ec6d33564db1f948ce1d3cbf844a5de481f3d1e2f82f7d5c6f56412fb"
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
