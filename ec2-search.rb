# frozen_string_literal: true

class Ec2Search < Formula
  desc "Search AWS EC2 easily"
  homepage "https://github.com/mocyuto/ec2-search"
  version "v0.9.0"
  license "Apache-2.0"

  bottle :unneeded

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 "f254c3fef79ddcef76cf2ad8b2e7727e8e14e5d8dba24a46967d3a15907d644e"
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 "82a991ad8025cbd5617cded9b1bc1b27f6ac6a80267644e303e3d96d848a0b75"
  end

  def install
    bin.install "ec2s"
    # Install bash and zsh completion
    output = Utils.safe_popen_read("#{bin}/ec2s", "completion", "bash")
    (bash_completion/"ec2s").write output
    output = Utils.safe_popen_read("#{bin}/ec2s", "completion", "zsh")
    (zsh_completion/"_ec2s").write output
  end

  test do
    system "#{bin}/ec2s", "--version"
  end
end
