class Ellipsis < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/ellipsis"
  url "https://github.com/PurpleBooth/ellipsis/archive/v0.6.33.tar.gz"
  sha256 "9c2c35c0a5cb67fe28926087b81c8eaaa472f8efead8045bd472abf4a4f54035"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/ellipsis-0.6.33"
    sha256 cellar: :any_skip_relocation, big_sur:      "5dbae980b6e2c383c7a3c8b7b1e09901c242ede3e21ca1604ef2d1d1b16cef23"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "861060ea6a7661f15d8ebe587296a3885626304d2b041d9527b8ed8e8b675ca2"
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
