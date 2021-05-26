class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "b50d9603cca6164595a742c678c27aa6db1cd28082c16502ff58d991973e6596"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.2"
    sha256 cellar: :any_skip_relocation, catalina:     "bdf8c0c4060e1f45eedb6c8eece982ce5e2a805dcf56f638b9f5668734d9f642"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c14f89afb2f5022f1d64fc5ea2fc24a5c888f30ea19f0d3cd8be59d0a06f7136"
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
