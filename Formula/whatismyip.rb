class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.12.0.tar.gz"
  sha256 "29811ca4568c23653d3da23d67d1115748161f76859a464dccaea36ba491c6a2"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.12.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b6cf1ff4455a2ca708acbbe0911ad26b3b8edac8fb26fff7a86dc47ea7157c87"
    sha256 cellar: :any_skip_relocation, ventura:      "92e6c515744ec5eb74fb587c70ef9bcac51b30e5b42875bd4d90696a215e194e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "70125c0b061d3a5ac0eae7d19d43c23620b3e8821c9425e7a0e6a834b1779a43"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/whatismyip", "-h"
    system "#{bin}/whatismyip", "-V"
  end
end
