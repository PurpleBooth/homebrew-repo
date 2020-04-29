class GitDuetWrapForSops < Formula
  desc "A wrapper for the git duet commands that lets you leave your authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/v0.3.0.tar.gz"
  version "0.3.0"
  sha256 "62be04a0b68499689872e3d713011246621758499302343076dbb0e09d69f349"

  depends_on "rust" => :build

  def install
        ENV['VERSION'] = version
        system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end
