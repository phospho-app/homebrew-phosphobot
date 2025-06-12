class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.44"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.44/phosphobot-0.3.44-arm64.bin"
      sha256 "7eda33de890ac2ba27b3a32a045d0dba39f0b9398be1b56d6e9befbe2800bb9d"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.44/phosphobot-0.3.44-x86_64.bin"
      sha256 "c296fdf1207d5a61c05c8e7e1da3906ee7e54dcf4aee6d9a81ad8f330ec2807a"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.44-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
