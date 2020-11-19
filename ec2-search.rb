# frozen_string_literal: true

class Ec2Search < Formula
  desc "Search AWS EC2 easily"
  homepage "https://github.com/mocyuto/ec2-search"
  version "v0.6.0"
  license "Apache-2.0"

  bottle :unneeded

  if OS.mac?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-macos.tar.gz"
    sha256 "14d0258f70d31cc1ce14daa0942861af74871149bf5e46470c21e69dd4ac72ff"
  elsif OS.linux?
    url "https://github.com/mocyuto/ec2-search/releases/download/#{version}/ec2-search-linux.tar.gz"
    sha256 "712b6b5148b7dbd945995b912829289ecd43483a9a1dd62f728aca0ab413009f"
  end

  def install
    bin.install "ec2s"
  end

  test do
    system "#{bin}/ec2s", "--version"
  end
end
