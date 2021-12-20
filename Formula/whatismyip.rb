class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.26.tar.gz"
  sha256 "01b351efc495aba93e9edef3ceb2cc21fae6c7e551f222f942cabf40270295d1"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.26"
    sha256 cellar: :any_skip_relocation, big_sur:      "a547f16f0160909eca193bf39896142ad42c64d7c6ac74225416e6c34d9cc9b9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "452c619dc8e43ff1aabe3fbf0dcef50bfd93d9abd956bd8a1c88093d2322b360"
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
