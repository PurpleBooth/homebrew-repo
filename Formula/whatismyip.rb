class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.11.2.tar.gz"
  sha256 "4249b7aa8312866779414feef8a2080329a9d6478237c54884c4c3aba7dab868"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.11.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "37da53cbf1f5b57d44d5ff5b61a2a86ecf776feb7839769123e1539da146b599"
    sha256 cellar: :any_skip_relocation, ventura:      "b8cc14bb080a58cd4c8d525e0edaadef3c72fc0a7f1e537af91672355c73c244"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f8f08e75be10b3dbca7414d835679e33fc30d65fe68736842f85acfc33b90f8f"
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
