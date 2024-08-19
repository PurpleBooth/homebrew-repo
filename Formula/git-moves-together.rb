class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/refs/tags/v2.5.71.tar.gz"
  sha256 "2ded86f53122b88bc97fd41b9a816e903dbc6c9f39a3e1edc1492017648d3387"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.71"
    sha256 cellar: :any,                 arm64_sonoma: "0cc129b16054b4c02eff1a8f5da3d86e23db0d8c9a6e5e04b3563e4806ecbb37"
    sha256 cellar: :any,                 ventura:      "011c1b292760cdbb695aa46c9566e15232c171675c84e93589ef08d3a24c6b11"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a4a2d83a967be7cf2497d537957e1c17e1ea3ec5e453670c5d5f706542baf6c8"
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
