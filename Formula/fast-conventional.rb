class FastConventional < Formula
  desc "Make conventional commits, faster, and consistently name scopes"
  homepage "https://github.com/PurpleBooth/fast-conventional"
  url "https://github.com/PurpleBooth/fast-conventional/archive/v2.2.2.tar.gz"
  sha256 "c367e2e69c4579a95d11805910c74240573e2de23e280f24f611f0e98ce31ce1"

  bottle do
    root_url "https://github.com/PurpleBooth/homebrew-repo/releases/download/fast-conventional-2.2.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "d80a79ea38c6fb621f81d0fa8359e01a83d9c12564623c27d93ebf1f4e52b633"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "a9d1abd757a3863e864b7416e92559090c80437c97107fd39ae07d355ce18c4c"
  end

  depends_on "help2man" => :build
  depends_on "rust" => :build
  depends_on "socat" => :test
  depends_on "specdown/repo/specdown" => :test

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/fast-conventional", "completion", "bash")
    (bash_completion/"fast-conventional").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/fast-conventional", "completion", "zsh")
    (zsh_completion/"_fast-conventional").write output

    # Install fish completion
    output = Utils.safe_popen_read("#{bin}/fast-conventional", "completion", "fish")
    (fish_completion/"fast-conventional.fish").write output

    # Man pages
    output = Utils.safe_popen_read("help2man", "#{bin}/fast-conventional")
    (man1/"fast-conventional.1").write output
  end

  def caveats
    <<~EOS
      Update your git config to finish installation:
        $ git config --global alias.fci '-c "core.editor=fast-conventional editor" commit'
      To use it run
        $ git fci
      You may add any of the usual commit arguments
    EOS
  end

  test do
    system "#{bin}/fast-conventional", "-h"
    system "#{bin}/fast-conventional", "-V"
    system "specdown run --temporary-workspace-dir --add-path \"#{bin}\" \"#{prefix}\/README.md\""
  end
end
