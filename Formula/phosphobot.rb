class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.84/phosphobot-arm64.bin"
      sha256 "96498047e70b777573652ebc250b3711fae92111c5c2f47a8af880ad4b577a6a"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.84/phosphobot-x86_64.bin"
      sha256 "c4c7b4e97e806691bc2a8d8581b07d2b0417ab982a9016a0969308699eda673f"
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
