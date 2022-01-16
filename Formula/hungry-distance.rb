class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.20.tar.gz"
  sha256 "ca305339c7d97d5c2a3eafa47da8ad94910fee9f047fa7d7ff5468c31c460d5a"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.20"
    sha256 cellar: :any_skip_relocation, big_sur:      "b068ccb5a040a4cfd80278ea36f607e7c5f3dd1500abb51a3d6463aaa04beac1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "53d8d50e55ab68acb48fff5c006dc5feb4833ac11781d5805bd9b4993e8f7108"
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
