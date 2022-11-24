class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.46.tar.gz"
  sha256 "3c0f61ea909ef258f6e90ba37def272415e3d7c4d3e61b50966ce08deb83cf90"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.46"
    sha256 cellar: :any,                 monterey:     "6296e2fec5da27e0cc19e27fd29caf2fd566490e0e01ae2327e58b6dceb884a9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ab42ba1de1d905adc3b06cf4606c2b5a97143381d59e0abf8e8d1ac2855bef46"
  end

  depends_on "rust" => :build
  depends_on "openssl@1.1"
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
