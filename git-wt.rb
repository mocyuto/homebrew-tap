# frozen_string_literal: true

class GitWt < Formula
  desc 'Git Worktree helper CLI'
  homepage 'https://github.com/mocyuto/git-wt'
  version 'v0.0.1'
  license 'MIT'

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_darwin_arm64.tar.gz"
      sha256 '1b341b3322e3057fb26dac0f47412cfa420e5a54f85f797f9a0087f2f9e1eade'
    else
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_darwin_amd64.tar.gz"
      sha256 '8564217145c058e24e81aa4c67dc171872a4bf4aeb9ba4200e22fb6b94c34a94'
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_linux_arm64.tar.gz"
      sha256 'a835c0a4a9e412f840d1959ce4cfcfedd14a17f0826584cfe9cff6caa7c110e2'
    else
      url "https://github.com/mocyuto/git-wt/releases/download/#{version}/git-wt_linux_amd64.tar.gz"
      sha256 '0792ef8962e8db8ac4306c0141517fcceb34a077a1b7d348f3daff885ed2579b'
    end
  end

  def install
    bin.install 'git-wt'

    # Install bash and zsh completion
    output = Utils.safe_popen_read("#{bin}/git-wt", 'completion', 'bash')
    (bash_completion / 'git-wt').write output
    output = Utils.safe_popen_read("#{bin}/git-wt", 'completion', 'zsh')
    (zsh_completion / '_git-wt').write output
  end

  test do
    system "#{bin}/git-wt", '--version'
  end
end
