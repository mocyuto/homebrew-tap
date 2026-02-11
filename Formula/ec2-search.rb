# frozen_string_literal: true

class Ec2Search < Formula
  desc 'Search AWS EC2 easily. named ec2s'
  homepage 'https://github.com/mocyuto/ec2-search'
  version 'v0.14.1'
  license 'Apache-2.0'

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 '22612fcbc6609478bfb7da68e7d1ae28217fd33b458eeba38b0bc749d5207331'
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 '1f64c4c2036e214f9d0d98fd03ae9bd67cbf71599ee572d7b36be5be71cdee5c'
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
