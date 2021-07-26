class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.7.tar.gz"
  sha256 "0fce8e010f1917192935751e1843988d4f15877c1efc1c6078e1840e6f3a0498"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.7"
    sha256 cellar: :any_skip_relocation, catalina:     "7fbc77e697557a0aa57c6270b51e061d700fdd086aea9d401e6ab56b831501f9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a439dc874d84727424ba903358a70143d497456680c51e58cd69f644850f4b03"
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
