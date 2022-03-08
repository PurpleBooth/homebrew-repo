class HungryDistance < Formula
  desc "Calculate the distance between two points in an XYZ space"
  homepage "https://github.com/PurpleBooth/hungry-distance"
  url "https://github.com/PurpleBooth/hungry-distance/archive/v0.1.26.tar.gz"
  sha256 "b1d480e3258a61b1cd7c80e260b19019c1277d39fd910ece8442a4a7ed808bb0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/hungry-distance-0.1.26"
    sha256 cellar: :any_skip_relocation, big_sur:      "cf27c509cd021eb40e7cb6610e81a97a8e6d8f9bab64550269c4bd03c64321ab"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fc8211fb37c9e48382509d839651ae83c8778e0edb96f800b9fcef954c1d3fb7"
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
