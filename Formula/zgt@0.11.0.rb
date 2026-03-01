# frozen_string_literal: true

class ZgtAT0110 < Formula
  desc 'Git Worktree helper CLI'
  homepage 'https://github.com/mocyuto/zgt'
  version 'v0.11.0'
  license 'MIT'

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_darwin_arm64.tar.gz"
      sha256 'aa2ccef991a42f32b2786f04b71d26e5deef265152e35f799834cffe625c7224'
    else
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_darwin_amd64.tar.gz"
      sha256 '9a857fff497a99597928d329113e66d16693fe32d21e6705506d858e9c695a11'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_linux_arm64.tar.gz"
      sha256 '5780c75b383e20ab46fd03e180ab4a4533727db5c92bd0681e148a69b8afa473'
    else
      url "https://github.com/mocyuto/zgt/releases/download/#{version}/zgt_linux_amd64.tar.gz"
      sha256 'b6ecea2f268708b07ebd6a0cf367f4326a53f266f1da0481592b00710a1d6daa'
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
