class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.11.5.tar.gz"
  sha256 "7ba750311bbf63f7caba66edf5e5e0ddce17516bd71f91cedad0558acdb70bed"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.11.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "be66e55f2bb9eba22fa31cb58451fbc7cdd45ece1b6e429b3c732d2d4665eab4"
    sha256 cellar: :any_skip_relocation, ventura:      "dd6daa69617bcffcad0c21065247a5371017cb96c29d38167faa0b19bbb9fbd6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b789683400e09fdb55bbd63da1993207ebb910074a4521d7ce2f969ba170d93f"
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
