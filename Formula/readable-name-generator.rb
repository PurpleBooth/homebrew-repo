class ReadableNameGenerator < Formula
  desc "Generate a readable name using Dockers formula"
  homepage "https://github.com/PurpleBooth/readable-name-generator"
  url "https://github.com/PurpleBooth/readable-name-generator/archive/refs/tags/v2.100.0.tar.gz"
  sha256 "df4fc9852fdac697644a3f58419f9a7051de7cb25572e12d7133bd3c43ffc03b"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/readable-name-generator-2.100.0"
    sha256 cellar: :any_skip_relocation, catalina:     "b8014a21591c5bfec68fa10be61b7adad25f6129fc4ec815883571bd7a6bbc4c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ce414d8eb1244def016ee9af372ecf61469804d43a18eccfd472f4ab8c2fdafa"
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
