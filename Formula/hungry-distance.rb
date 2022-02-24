class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.24.tar.gz"
  sha256 "569988786a985acac53bd45d3495dd6c07e46d641d8840bc5bc5c16331b6a5eb"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.24"
    sha256 cellar: :any_skip_relocation, big_sur:      "919f2381e67a3d9c2c0f0da6909c905401c0a1d084198d4934c70830167caba7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "92703dce97d7333ffd85555241bdc4ee29d439bdbc3d297138960217867429e2"
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
