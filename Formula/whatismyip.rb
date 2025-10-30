class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://codeberg.org/PurpleBooth/whatismyip"
  url "https://codeberg.org/PurpleBooth/whatismyip/archive/v0.15.21.tar.gz"
  sha256 "0eee4ebae3a1083cf39651c026c1ec48577defcb5f62fe3af75b8ae3d5b70e39"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.15.21"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5008cf103861b988a5633206934aa9aa9db019788302c625bbfd129a32a02beb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f82f2aef5e02d1bdb9f10caa1de51c7d31b46f13a3614189de80c3efd56590b1"
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
