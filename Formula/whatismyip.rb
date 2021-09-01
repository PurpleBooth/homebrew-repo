class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.13.tar.gz"
  sha256 "c338857505651e0198ed2184708970052af114368e0e2fe6468d83b55b779b8c"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.13"
    sha256 cellar: :any_skip_relocation, catalina:     "ff8103f07ef46515bb49af24e43c2bc9c4260794aaca0f6fc9e6f151020b2067"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a17fbf73c4d3ba99ea4c00fd46f6014714ce8584ba8fbc40992e60b9acf859c0"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/whatismyip", "-h"
    system "#{bin}/whatismyip", "-V"
  end
end
