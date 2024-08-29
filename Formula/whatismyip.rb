class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.13.2.tar.gz"
  sha256 "05ec977bc3e24a4e5f8bb762d0356074e29770d747e53f2000cdf8a4ee0ac345"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.13.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8f0b573ec8964216ed668a9b96d21129de0c99916cd0057c3e5e186e63b77c6e"
    sha256 cellar: :any_skip_relocation, ventura:      "fbcaf5a11c0713565fd815f8f05661af9c8567bf17da2212249349ab37f17cc2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "65f502fd49d13ebed3a14e9bb0ce1b7a59872cef6ca79180712eece40dc5e940"
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
