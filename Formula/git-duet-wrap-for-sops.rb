class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/refs/tags/v0.19.0.tar.gz"
  sha256 "a21d9d15166e48c970f5b38cf9bd0a2cae5c66e22081fe59f35bc87b9ad650fc"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "61a7f3cb0b6db8f680ffc90098cc784f7e620ff8aab136073a628c8a3f66143b" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end
