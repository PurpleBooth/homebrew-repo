class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/v0.16.0.tar.gz"
  sha256 "2a03c0a5d19d075748b0925f92d4145f504b0e840dcee90c2d8c18650feba87d"
  revision 2

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "86d040c7ad1bc6fc03e685583ef34147834763a982af8fcdd1342b3b11ef04e0" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end
