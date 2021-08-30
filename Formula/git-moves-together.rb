class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.1.0.tar.gz"
  sha256 "ce906109d8e5fa840dac2be2adaa1ebec4a5f03351c179024b06338422711f49"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.1.0"
    sha256 cellar: :any,                 catalina:     "4ee332f70bb789907ece97c40bc4939ee90c1dd4105219461496172657bbdf06"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2e71456d5e8553e7c9a63b7303ddfc8f9c162facf3b33700dafb456d69c31c6c"
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
