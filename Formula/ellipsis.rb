class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.48.tar.gz"
  sha256 "6ddf62900cbde9164f26c23a0ebf63538ceb065fb287e79a85825ce9bbb43145"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.48"
    sha256 cellar: :any_skip_relocation, big_sur:      "37fc591c2a0bae41ac50de9e72bda0defb39492e011a2cacd5d1ab8a416d9a7a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ba00498c69371fea9d154f30c36045d63d9d467ad05e6bfb36ea6fa0201f6ccf"
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
