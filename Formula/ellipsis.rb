class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "64dba2ceddd974e245498abfe78a217add4038da5e9cb7724cf6ed241f9a3681"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.0"
    sha256 cellar: :any_skip_relocation, catalina:     "dc2a8be077200cbf07627b491988def5dba0d151a99427323348494e4d7dddaa"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ec653c5cc6fe3d7a0ca275d0965900bebd8182a00c334b3a733881d4d8aee196"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ellipsis", "-h"
    system "#{bin}/ellipsis", "-V"
  end
end
