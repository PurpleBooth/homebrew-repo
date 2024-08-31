class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/refs/tags/v2.6.3.tar.gz"
  sha256 "98880f26ebd8380289afd2d543c53c2c9b300bba979561c825f5235a503394ae"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.6.3"
    sha256 cellar: :any,                 arm64_sonoma: "ecdb8629facd812cbfbf43a3ac7c37da84e271998607c4ce9a8de306b05c6520"
    sha256 cellar: :any,                 ventura:      "b7489e79f64eebdcbd3eeeda8b98f707e1840755ad83880ab73abcf1fb979c51"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2b15f237bf575ef4b2b548a7a2ba20b30e9fa4f2321850556064620195c25529"
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
