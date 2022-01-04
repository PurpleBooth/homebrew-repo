class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.27.tar.gz"
  sha256 "51885f1f9b055ad664fbe6e14625bde2a1a765c01689c051cc3620675852be18"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.27"
    sha256 cellar: :any_skip_relocation, big_sur:      "1d928f1d333d2f5567124ea685ad66bdafc101be13f54e5cc5a8f932f1d97710"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "fe8404099bf2af448e3cd8d7789ea41a55ea2ac7d112b95815f94cf0f3aea047"
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
