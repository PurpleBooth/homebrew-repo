class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.28.tar.gz"
  sha256 "48b0aa819c70857e583464fb1c20705892aa35dec2f84fce6c4977e600fcfb8b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.28"
    sha256 cellar: :any_skip_relocation, big_sur:      "0c26cf51eda6257e4844d7d5c0be98458025b58001718527b0890f1db8e33e9e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5593cc4f035bf341ebc348997712680c9d9069c1615fefdddca0e36e0b975a42"
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
