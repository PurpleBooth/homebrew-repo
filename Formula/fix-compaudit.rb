class FixCompaudit < Formula
  desc "Fixes problems reported by compuaudit"
  homepage "https://github.com/PurpleBooth/fix-compaudit"
  url "https://github.com/PurpleBooth/fix-compaudit/archive/v0.46.69.tar.gz"
  sha256 "9bc44c393f420e30073b9a0072b3e157f8e9377028a0711e8fd4edaa4ee11988"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fix-compaudit-0.46.69"
    sha256 cellar: :any_skip_relocation, big_sur:      "fb0be2e6b48194dabe0ae90b992ac5b09310c50580103ed34cefd51466a843e7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8c4e881bd84088299143b2e0311b726f63f9537aab601e366968b64385e76224"
  end

  depends_on "rust" => :build
  depends_on "zsh"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/fix-compaudit", "-h"
    system "#{bin}/fix-compaudit", "-V"
  end
end
