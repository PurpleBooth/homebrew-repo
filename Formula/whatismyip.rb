class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.6.4.tar.gz"
  sha256 "1b8fb969a314b2dfa554cc8f7f3a70e4d7f0be2aef1dcedd97b2f5d37e741d00"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.6.4"
    sha256 cellar: :any_skip_relocation, catalina:     "14f9e9414d82a4a63fa53bf46debc62048547206ecaf79e487601ad5b9ee6715"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8e5fe2d43ddf01ad32bad9478936092e27a9e84cde9c583c7c6142eae5d57ff0"
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
