# frozen_string_literal: true

class GitWt < Formula
  desc 'Git Worktree helper CLI'
  homepage 'https://github.com/mocyuto/git-wt'
  version 'v0.2.0'
  license 'MIT'

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_darwin_arm64.tar.gz"
      sha256 'ff40985f77e414279e150f0df598216d83014c1936c1e23d311db74967f97dd8'
    else
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_darwin_amd64.tar.gz"
      sha256 '335e3c4a9b4b8a4f339436da493bae426fcd9db637c01714b06fe0c1a174eba6'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_linux_arm64.tar.gz"
      sha256 '32a3f7f0e240d80f1fcf7041fac7629e44d828108edf780ca51d158d7b6f6efe'
    else
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_linux_amd64.tar.gz"
      sha256 '212a8d3f125b842bbe396d027e406027e8130c832a6d482c0e524b58f0734db0'
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
