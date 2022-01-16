class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/v0.9.32.tar.gz"
  sha256 "48893e51c08a7ebcc253df990477d86d9444ba825776d306cd776db388320fd5"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.9.32"
    sha256 cellar: :any_skip_relocation, big_sur:      "4621f58787abcb9e2fcee2dba57f2ae300ebb79f0b7d32609bc586abd6ec46db"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f5bd233a5d6f8989f5ad988184d6c2cf2938120204a7ef490540e668ad32b970"
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
