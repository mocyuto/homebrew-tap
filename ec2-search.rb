# frozen_string_literal: true

class Ec2Search < Formula
  desc "Search ec2 instance easily"
  homepage "https://github.com/mocyuto/ec2-search"
  url "https://github.com/mocyuto/ec2-search/releases/download/v0.2.0/ec2-search-x86_64-apple-darwin.tar.gz"
  version "0.2.0"
  sha256 "8b8379a15fc144cefd8e27aadc611abc85bccd2b34a6f11795815e4b4620536e"
  license "Apache-2.0"

  def install
    bin.install "ec2-search"
  end

  test do
    system "true"
  end
end
