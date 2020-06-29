class GitDuetWrapForSops < Formula
  desc "Keeps your git authors file encrypted"
  homepage "https://github.com/PurpleBooth/git-duet-wrap-for-sops"
  url "https://github.com/PurpleBooth/git-duet-wrap-for-sops/archive/refs/tags/v0.39.0.tar.gz"
  sha256 "5c8f9a57473cfa302edd6c549b465f5baf4e6fbb22c7769ee80ceff7fb8e1d35"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "9de8f0bb77dd413a9be42cfac9266954370cf5c913e8a4308302d6c58bb3d9d7" => :catalina
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "true"
  end
end
