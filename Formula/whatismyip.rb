class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.2.tar.gz"
  sha256 "39a950b265ea28428db677fcdf580cd311a264c5791d345e3a5575fd7876c827"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.2"
    sha256 cellar: :any_skip_relocation, catalina:     "c2fbeddeb12f61ccf381d35850add1be76a988cf7b05835f0930f9d5a33a4550"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "67137cce14e6aebf825cf72a45373475bf091f0447ef421301c728919408e7cc"
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
