class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/refs/tags/v2.6.1.tar.gz"
  sha256 "9ead77d3cbe39f57416f4366fca8fa5664920b2a90b631ae8fdb32775dca2cd7"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.6.1"
    sha256 cellar: :any,                 arm64_sonoma: "f8529b390132c98e933fd03635c639390805be0fd30a51666d4b08c1f43b6e4d"
    sha256 cellar: :any,                 ventura:      "cbc3732e9301a0a5258482cb1b3010f9e209f257bde8aa934a356e6ba38e3db7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8c0ef07ca997ee4bbd40a7e333e73f55296cc1bd7b78e9d17e35c04b85fda7cf"
  end

  depends_on "rust" => :build
  depends_on "openssl@3"
  on_linux do
    depends_on "zlib"
  end

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "git", "clone", "https://github.com/PurpleBooth/git-moves-together.git"
    system "#{bin}/git-moves-together", "git-moves-together"
  end
end
