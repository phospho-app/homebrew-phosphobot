class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.101"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.101/phosphobot-0.3.101-arm64.bin"
      sha256 "dbe709329d6e00ddc495da791b163fc924f9deac93658b83032812654924a963"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.101/phosphobot-0.3.101-x86_64.bin"
      sha256 "dcf8ad0d0a5444a59777b1b72c7216fb0bbb9e0897fce1094eb9f167cf4bced6"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.101-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
