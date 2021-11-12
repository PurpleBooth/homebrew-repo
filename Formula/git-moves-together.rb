class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.5.tar.gz"
  sha256 "38ae4cda300f5a2d55e7cf3e47e802ee25c19fc9d9df7e06a8f81f8df7efd0f3"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.5"
    sha256 cellar: :any,                 catalina:     "da68d83914fc49d18db23aa0e393fe582d310e2dab3f4abdad8af42938993718"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "282d09996185241a9c56f849c9dddaa0f51f0e03b9919349958c3f0f75b4cdb8"
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
