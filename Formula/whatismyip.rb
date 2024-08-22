class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.11.7.tar.gz"
  sha256 "b8bef34350471a21eb4f48f05681fc56002eaabeb1aa41488b25fa2c0fc19f57"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.11.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2805ae94e4b387d679e40fc35e2b410c7c6779773a3fad67e4dd705cbaa8920f"
    sha256 cellar: :any_skip_relocation, ventura:      "a282f33b51757b0e2aabddbcc0d01b0b4aac7c1b500c995341ffbedb0bd92deb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f4e0da0865daff25a0679c98402d9ecaa9a3c38b1846bafb77a5c5773b9167df"
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
