class ReadableNameGenerator < Formula
  desc "Generate a readable name using Dockers formula"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.51.0.tar.gz"
  sha256 "c1c3fd20c99e078d6982cc2d3b4ddf79a8ebf78e5e1e93d3d3011fc2d6d8bba5"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "1f5837511017ec47b33ec84d171f9119cb39c4ca11ea7fc5db6d8abc89acedb5" => :catalina
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
