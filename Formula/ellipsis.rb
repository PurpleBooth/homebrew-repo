class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.55.tar.gz"
  sha256 "a9011064cae2cc491f5e9104db0d8316b9671e0b9683864d3eca1c2bd2ee2765"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.55"
    sha256 cellar: :any_skip_relocation, big_sur:      "46f084d25ca554dac3d16d5cc21964404979766696baeea75a49bd6312711dd5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "712550c9e2db4b8058b5ed44ed4da6a65f25e6e61023cee3249adc37dddaa304"
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
