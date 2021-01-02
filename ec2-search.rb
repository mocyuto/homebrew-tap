# frozen_string_literal: true

class Ec2Search < Formula
  desc 'Search AWS EC2 easily'
  homepage 'https://github.com/mocyuto/ec2-search'
  version 'v0.10.1'
  license 'Apache-2.0'

  bottle :unneeded

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 '96952b2afc94b983e2b3f9119be865cad1116a6f0b5488622c8cb800e2d6781f'
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 '8cfa5220574a848e5fa8dfa67310c4c4735bfef700b5904593fd3b94dd39397f'
  end

  def install
    bin.install 'ec2s'

    # Install bash and zsh completion
    output = Utils.safe_popen_read("#{bin}/ec2s", 'completion', 'bash')
    (bash_completion / 'ec2s').write output
    output = Utils.safe_popen_read("#{bin}/ec2s", 'completion', 'zsh')
    (zsh_completion / '_ec2s').write output
  end

  test do
    system "#{bin}/ec2s", '--version'
  end
end
