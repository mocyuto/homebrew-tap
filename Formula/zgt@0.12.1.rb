# frozen_string_literal: true

class ZgtAT0121 < Formula
  desc 'Git Worktree helper CLI'
  homepage 'https://github.com/mocyuto/zgt'
  version 'v0.12.1'
  license 'MIT'

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_darwin_arm64.tar.gz"
      sha256 'd823e4a0c193d887d1ba70b35df69a0f1bd55a1dd015bd3c5addbbc69056e390'
    else
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_darwin_amd64.tar.gz"
      sha256 'd62e79c77055817ec54f690676bd5495a9683f7d73876147c2d37a006844accd'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_linux_arm64.tar.gz"
      sha256 'bf2c073c6df12d38c860b7f117510bbbc9fa707231d0ab7df462b4cb0ae8136e'
    else
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_linux_amd64.tar.gz"
      sha256 'fe8b27e1ea01c0278df28f949cd8161ee30bd32411bd1a4399986b269db93c35'
    end
  end

  def install
    bin.install 'zgt'

    # Install bash and zsh completion
    output = Utils.safe_popen_read("#{bin}/zgt", 'completion', 'bash')
    (bash_completion / 'zgt').write output
    output = Utils.safe_popen_read("#{bin}/zgt", 'completion', 'zsh')
    (zsh_completion / '_zgt').write output
  end

  test do
    system "#{bin}/zgt", '--version'
  end
end
