# frozen_string_literal: true

class Ec2Search < Formula
  desc "Search AWS ec2 easily"
  homepage "https://github.com/mocyuto/ec2-search"
  version "v0.4.1"
  license "Apache-2.0"

  bottle :unneeded

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 "0a51335609841fbc8c98361c61d979ad75c59af0168b696ce63fb9d4edb8dc3c"
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 "842eb65489e9f39d7101e19ff4552eb12c09b90669c1757919790e0444e180d5"
  end

  def install
    bin.install "ec2s"
  end

  test do
    system "#{bin}/ec2s", "--version"
  end
end
