# frozen_string_literal: true

class Ec2Search < Formula
  desc "Search ec2 instance easily"
  homepage "https://github.com/mocyuto/ec2-search"
  version "v0.3.1"
  license "Apache-2.0"

  bottle :unneeded

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 "47c75001c5d01561ecedcd543117f813dc58892e8d252676de936a199b4d659c"
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 "f90c297f62b22f893c985a9f90eb01cf728f866c92784918f36c8a2178ad001b"
  end

  def install
    bin.install "ec2s"
  end

  test do
    system "#{bin}/ec2s", "--version"
  end
end
