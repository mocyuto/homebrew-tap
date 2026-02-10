# frozen_string_literal: true

class GitWt < Formula
  desc 'Git Worktree helper CLI'
  homepage 'https://github.com/mocyuto/git-wt'
  version 'v0.2.2'
  license 'MIT'

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_darwin_arm64.tar.gz"
      sha256 '70364d25f29e2501d48450d52a7207dfb142c6c70bb8dd747744ba936564c89c'
    else
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_darwin_amd64.tar.gz"
      sha256 'ef2a76a1df0ee181e070a05b37667782175a50a47206f3ac39053aa43635d582'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_linux_arm64.tar.gz"
      sha256 '0bafdfc0fbd55986f55c8097949cc057a481ee1c67942c773603cd7a70756064'
    else
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_linux_amd64.tar.gz"
      sha256 'b4f3a17c51d1ac58de4fca64883b05e12aa13a6c717e754349c0e9976f99522c'
    end
  end

  def install
    bin.install 'git-wt'

    # Install bash and zsh completion
    output = Utils.safe_popen_read("#{bin}/git-wt", 'completion', 'bash')
    (bash_completion / 'git-wt').write output
    output = Utils.safe_popen_read("#{bin}/git-wt", 'completion', 'zsh')
    (zsh_completion / '_git-wt').write output
  end

  test do
    system "#{bin}/git-wt", '--version'
  end
end
