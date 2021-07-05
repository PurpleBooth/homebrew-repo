class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.4.tar.gz"
  sha256 "d37b20b00e0e2909676ea394b3a39bb273a694bdff1a4b4fe64e04608a50902d"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.4"
    sha256 cellar: :any_skip_relocation, catalina:     "99b9f5c747e4176fc056ca634d8e2bb26828987b4b759e292c410a77e7724a9b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7bc10b868842177ab84ea49da97e0146f325ea6d90d5b3078248d9ff7d14d2e6"
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
