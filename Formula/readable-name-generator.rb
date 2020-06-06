class ReadableNameGenerator < Formula
  desc "Generate a readable name using Dockers formula"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.31.0.tar.gz"
  sha256 "181e0e3fb54003c10f5f60f5a5d8ef661f786776aba76e6fdcff2868cbb8d832"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "d1b2d44205c0952d573ef6a8f9a048fbf70e09657f0330246e5f783c8dad3ad1" => :catalina
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system "#{bin}/readable-name-generator"
    assert_not_equal "", shell_output("#{bin}/readable-name-generator").strip
  end
end
