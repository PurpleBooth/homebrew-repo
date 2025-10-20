class Whatismyip < Formula
  desc "Work out what your IP is"
  homepage "https://codeberg.org/PurpleBooth/whatismyip"
  url "https://codeberg.org/PurpleBooth/whatismyip/archive/v0.15.19.tar.gz"
  sha256 "76b67907480fd226bcc650fd02e6e76a2114126bf972f01e508f0131d8a27009"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/whatismyip-0.15.19"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "57b7c62cc98e1bbe5cbb249791d3d393e5178bb82b1de66885fa06245ea99b61"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "77280b5a4bab9b212a26db4c1c9d28362759851335ed748edbe1d9acf692a358"
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
