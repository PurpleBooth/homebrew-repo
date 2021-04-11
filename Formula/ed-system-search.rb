class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "35329d3962a0c12d8184dcbbb40773ce4f9a0dde6b39fc6a7188bfc78cc5093f"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.9.0"
    sha256 cellar: :any_skip_relocation, catalina:     "7186f5174e4d611312bd097286f83febdde79d510ac5e274ca1b30382920f063"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ddd6b5d8f39f0540dd26bd5b460d201c1fcdf806150943a9aaf92eeeb111fd5f"
  end

  depends_on "rust" => :build
  depends_on "zsh"

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/ed-system-search", "-h"
    system "#{bin}/ed-system-search", "-V"
  end
end
