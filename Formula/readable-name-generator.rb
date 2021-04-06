class ReadableNameGenerator < Formula
  desc "Generate a readable name using Dockers formula"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.100.2.tar.gz"
  sha256 "9209f92baa41a06ab8da4ae5bc6688a0ab504a6cd5a33f4086efb18543b2e852"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.100.2"
    sha256 cellar: :any_skip_relocation, catalina:     "57fe295edb3d5aec09fc78030ee37f47a92851d4acfa56efe626f07c0263d125"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a1cdcf075c70047b29ff5b93f5586f2f0fb4a08df8bdb3e4cc69076a35c19930"
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
