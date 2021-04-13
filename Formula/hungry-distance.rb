class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "de5852c63156f9b601824184f064916162a8ac75d7f22126b1333aea52c28532"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.8"
    sha256 cellar: :any_skip_relocation, catalina:     "396d434e58d4a3f2248aec0d435bf43951d7223e2424a10f652f730e856e0f93"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7519b55a0a2a654512e099fa264790eaf3785d74601ad5b6144f60047014003e"
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
