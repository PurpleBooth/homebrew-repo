class GitDuetWrapForSops < Formula
  desc "A wrapper for the git duet commands that lets you leave your authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/v0.0.0.tar.gz"
  version "0.0.0"
  sha256 ""

  depends_on "rust" => :build

  def install
        ENV['VERSION'] = version
        system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end
