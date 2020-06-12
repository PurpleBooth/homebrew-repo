class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/refs/tags/v0.33.0.tar.gz"
  sha256 "6abc8f2463bd36e7d1b837487d1bd2b1c984bcb2c814651ec9f23b1a7f79e733"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "a6d9fae0814d46ca0d615a25dbfd8a485c0fc0ef3e9e51ed0354456adb0d9daa" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end
