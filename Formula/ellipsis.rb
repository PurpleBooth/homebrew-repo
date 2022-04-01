class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.39.tar.gz"
  sha256 "400b5dba36779a64c99b2592463222c9ee3953eb0f92a29382999c7e3f150bfc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.39"
    sha256 cellar: :any_skip_relocation, big_sur:      "8759784d9dc196b5bea1eb0beaf4bd403d92ecb1f86e5d1c6cd79fa02bcd1ab1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "de4f8d8589b8fc324175a4b25617223008bffb2b8c9e2352d7fa4318ac002507"
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
