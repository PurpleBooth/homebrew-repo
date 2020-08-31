class ReadableNameGenerator < Formula
  desc "Generate a readable name using Dockers formula"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.68.1.tar.gz"
  sha256 "1466551515a143a38b8670e23aff5133cb34f521c7027f469c06c9dd4d6d6696"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "8abcf249b73acdc48608e9023ee21bfb8aa15f243b155869c377b9876e010aac" => :catalina
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
