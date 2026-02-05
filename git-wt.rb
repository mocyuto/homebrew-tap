# frozen_string_literal: true

class GitWt < Formula
  desc 'Git Worktree helper CLI'
  homepage 'https://github.com/mocyuto/git-wt'
  version 'v0.0.2'
  license 'MIT'

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_darwin_arm64.tar.gz"
      sha256 '70628e07f7483ee96d849de44e43d52226d8281ce7a044a76582eb9748f97717'
    else
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_darwin_amd64.tar.gz"
      sha256 '6ef726d0cda15d6c41dd520c5eb1bcfbd8c2a0e3e77491e007f972891cab669d'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_linux_arm64.tar.gz"
      sha256 'b9fc8db2ef634372483e2b4c86a9dec2d3ab0837e3e024ee3224dd030f44ad0a'
    else
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_linux_amd64.tar.gz"
      sha256 '63b1957d3a6612eda7bd54493324b8f3c682967212020c3ca6c4398bd688bc5a'
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
