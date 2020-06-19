class ReadableNameGenerator < Formula
  desc "Generate a readable name using Dockers formula"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.49.0.tar.gz"
  sha256 "d57158cbcfd08d696bc403a68edc9532710ed6a93509ae94ae005bc247f15302"

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "e99073a7b0e3b63d0a8e426c68c977a3b28cf3a5632933943d4d75f4f38e299a" => :catalina
  end

  bottle do
    root_url "https://dl.bintray.com/purplebooth/bottles-repo"
    cellar :any_skip_relocation
    sha256 "58c403820db589c1f0e1f41e2e1d80094d432e380cc0c96851868e25261a1066" => :catalina
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
