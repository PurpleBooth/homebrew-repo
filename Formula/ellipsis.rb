class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "57f7e8f951f2c9e1e441f7bf55bc225a8d4fbbe65747947f9869e52037814125"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.4.0"
    sha256 cellar: :any_skip_relocation, catalina:     "9b1ccbce63aca719e22532569e5af969a316719b7f925655aa3f019a8f0b63d8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "73dd77296325c498b9a04d8acb69b58cafc4fb84dcec9dae88cd52c6cef8c77b"
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
