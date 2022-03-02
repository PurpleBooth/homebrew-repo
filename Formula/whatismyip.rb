class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.40.tar.gz"
  sha256 "852de9d19d99c41eff444195b1d4cb50a687ce89601d06026afec07f446ea3e2"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.40"
    sha256 cellar: :any_skip_relocation, big_sur:      "d323c734bf96b6492dcb248b1d1552df9b025d0274645c11f91f4f72622b8b87"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a7b82691d4eabbd56855df5f31a7c66f4458e665cb838f659a492fff5c5fe561"
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
