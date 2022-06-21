class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.47.tar.gz"
  sha256 "4ed4c898181bec79efbdfbe29ce8d5df802529491608d18874e50ad029d3e03e"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.47"
    sha256 cellar: :any_skip_relocation, big_sur:      "eb3f104764008034b82240635e2a3e33e8d24305ceb16d68c01e7e6fe339751f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4d0571a7a9a397a02d70bcc050b1f6ec94e59bc2689639d450532d8f4800f631"
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
