class GitMovesTogether < Formula
  desc "Find coupling in git repositories"
  homepage "https://github.com/PurpleBooth/git-moves-together"
  url "https://github.com/PurpleBooth/git-moves-together/archive/v2.5.17.tar.gz"
  sha256 "dbfd663eaefdd174cb55f79a1893d147cf47155642f25e2a660641b41d342818"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/git-moves-together-2.5.17"
    sha256 cellar: :any,                 big_sur:      "f2e558308a131525a95146bf5d115e01b7282d209497cda408386847f07926ae"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5728b5d7e1aa72f9fdbadfde1fadd7e0297ac7819b8b4c5ae1ebdcfc785a324c"
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
