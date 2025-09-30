class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://codeberg.org/PurpleBooth/whatismyip"
  url "https://codeberg.org/PurpleBooth/whatismyip/archive/v0.15.12.tar.gz"
  sha256 "efbbc7d1737d1c574fe5d2f7eb3c0a784d83347fade25ea28fd931abc49d5a5e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.15.12"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d575f6f0a2f9958eb9cbc939fed51eec6599ab890b39d6f6a3de2f928894bbde"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f6076fac579e3be0fa29ee3940aff54b316390cfaf106689079df52f88915013"
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
