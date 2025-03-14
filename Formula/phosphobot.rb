class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.86/phosphobot-arm64.bin"
      sha256 "b6aebf20dad87e9cf1def471e1b1f7bd605cc89749d81a4651fd28f3709edb7d"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.86/phosphobot-x86_64.bin"
      sha256 "56ed3e5cf64b1f44a8f0d97fd37378117176359a057716d500e52a5deee4a9c4"
    end
  end
  
  def install
    bin_name = Hardware::CPU.arm? ? "phosphobot-arm64.bin" : "phosphobot-x86_64.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
