class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.54.tar.gz"
  sha256 "2e9a61efea7b3d2d2621b1b56e9b50f9f8dd1ecd6728adcc51cc704253ef66e5"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.54"
    sha256 cellar: :any_skip_relocation, big_sur:      "eed8b5c831550952c203b121f7634ae90b8fb3937ce72a0affea7b16a8ef5588"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "14a95b82dbc2de5ef4da49b7cb70447c88220b82b71d9485eaf6da69d321c921"
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
