# frozen_string_literal: true

class Ec2Search < Formula
  desc "Search AWS EC2 easily"
  homepage "https://github.com/mocyuto/ec2-search"
  version "v0.8.0"
  license "Apache-2.0"

  bottle :unneeded

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 "e82aeb576c8062c622ac4fb9236d4086f4d596cd515d8937c5af4b647747b236"
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 "bc373b7057764a09b68aae1cfa0d23b2439fba0d97c2ae1508df77df96b735d2"
  end

  def install
    bin.install "ec2s"
  end

  test do
    system "#{bin}/ec2s", "--version"
  end
end
