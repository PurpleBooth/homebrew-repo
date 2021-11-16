class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.20.tar.gz"
  sha256 "580b297a110318f68329702f386e89ca25141f70667a7190726d546c589d20d0"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.20"
    sha256 cellar: :any_skip_relocation, catalina:     "e679c3582f4294f22b4571a0f359f1803b2a84ba81e19749eb957c1fd8578bac"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c8e18f2a6e7b4f70ed6b61d190e828687ff0aa476faefbdf20f5dd4481d8100b"
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
