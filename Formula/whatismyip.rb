class Whatismyip < Formula
  desc "Manage and provision dotfiles"
  homepage "https://github.com/PurpleBooth/whatismyip"
  url "https://github.com/PurpleBooth/whatismyip/archive/refs/tags/v0.11.4.tar.gz"
  sha256 "32037e1969c2a1c28e379c37d93b42baac940963a4ec2ec0dd32eb7a53e9ea88"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.11.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d3e5a17f86a07c377569c816c34b8a62ad728eeead00c0e00175eb8b9f3afb05"
    sha256 cellar: :any_skip_relocation, ventura:      "c79cd0cc110d4f649425743ad08a677eaaa4f4b1cf426de3e9cea28ee44f08b2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "11f55b9d96fc26665bdf0d55bd2007f22b557821ce9c5be652cf9556d037868e"
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
