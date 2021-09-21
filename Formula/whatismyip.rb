class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.15.tar.gz"
  sha256 "38c260191977b7755486f18628ea43602341f7d96739f8e07e9eacf3a68a70bc"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.15"
    sha256 cellar: :any_skip_relocation, catalina:     "76ba320605bb7786106699e630180186153cd71455d4d7b9fe9249ab89f83f06"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "79b73f81893899102aeeb8754e1c4688c4c48cecc497cc04ccf6b83fa3182788"
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
