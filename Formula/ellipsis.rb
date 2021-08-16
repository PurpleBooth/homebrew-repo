class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.7.tar.gz"
  sha256 "0adae18df5d9a11a3cdc1dd1b5ecedb5961b140ae2e8279be17ddb405a6a322b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.7"
    sha256 cellar: :any_skip_relocation, catalina:     "a21c369db1e3b16493d8ed05ea570a50ba7913aa635886560a8b66a369f7473f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f7e623768b9b6957f9547bcdf27982554637f447aa8ea8492732203d5723bb46"
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
