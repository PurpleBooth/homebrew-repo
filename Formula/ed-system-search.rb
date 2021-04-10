class EdSystemSearch < Formula
  desc "Find interesting systems in Elite: Dangerous"
  homepage "https://github.com/PurpleBooth/ed-system-search"
  url "https://github.com/PurpleBooth/ed-system-search/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "a96e71e5248f0e24b27fb4f3b258b68b564d6c92197a37964f6d77c459d78114"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ed-system-search-0.5.0"
    sha256 cellar: :any_skip_relocation, catalina:     "bbaaefa3fa3064aae48e2ad4972589abb10469d8f2c02ba5f84dcb5727832974"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8acc59a3bc29698fa848438ef5a7557616325bec0fe5e0a62726eadec019af4c"
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
