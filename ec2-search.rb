# frozen_string_literal: true

class Ec2Search < Formula
  desc 'Search AWS EC2 easily. named ec2s'
  homepage 'https://github.com/mocyuto/ec2-search'
  version 'v0.14.0'
  license 'Apache-2.0'

  bottle :unneeded

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 'd81ce37fc81451932e6e80f52d74f137bfa8bef79d8c1f49e58f67151e90846b'
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 '84db89663151d090fdb25d0a9dce31cea1ff6b49b38076eb6dbf91e3b9e4f49e'
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
