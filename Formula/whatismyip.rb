class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://codeberg.org/PurpleBooth/whatismyip"
  url "https://codeberg.org/PurpleBooth/whatismyip/archive/main.tar.gz"
  version "0.14.3"
  sha256 "774cee1b8017e537e19e943a7a6f41884902ba6104e701a67a00cb6ca71c9241"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.14.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "971650c0ea311958b762a3cdb3e5868e165de4c8c8f2de9554201af7be118ee1"
    sha256 cellar: :any_skip_relocation, ventura:       "f81fdc1ce39c3605d6f2c1caa45124a0f0d6075edefc16c462fc554a86d445e2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "253c09ba654a70c368428e692ea1f785704e8c326a525c4594a1ebcdfc1bfb86"
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
