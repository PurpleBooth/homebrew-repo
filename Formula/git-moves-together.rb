class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.51.tar.gz"
  sha256 "2741302793fb9074f7a02bc936fbcd6b02f0603060f3664658ba0346606968ee"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.51"
    sha256 cellar: :any,                 monterey:     "bde091fdfec91beaf9793ecbef7d8556cf58eed5fabf597410483e16d01e9b01"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e184eaa24c44a96b64a48373d5115aa61fd284d30d2174ba34816fb8385333c4"
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
