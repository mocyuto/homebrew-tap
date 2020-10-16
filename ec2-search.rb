class Ec2Search < Formula
  desc "search ec2 instance easily"
  homepage ""
  url "https://github.com/mocyuto/ec2-search/releases/download/v0.2.0/ec2-search-x86_64-apple-darwin.tar.gz"
  sha256 "8b8379a15fc144cefd8e27aadc611abc85bccd2b34a6f11795815e4b4620536e"
  license "Apache-2.0"
  version "0.1.0"

  def install
    bin.install "ec2-search"
  end

  test do
    system "true"
  end
end
