class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.8.tar.gz"
  sha256 "12131bbdcc18ca46c6ffa6d4f0f280359b6d3632e91744fa03b8d5375533dd62"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.8"
    sha256 cellar: :any_skip_relocation, catalina:     "a2b356931869873f591920bef09198c3d899543b93b12d195641fe7046352bdf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2f0bb3ff49327067137713bed97e79c5bfa399037d4053a77a0388dcc82315ef"
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
