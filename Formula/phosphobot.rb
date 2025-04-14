class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.139"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.139/phosphobot-0.2.139-arm64.bin"
      sha256 "80b4d6aae4cfc0cc18935484da77f1c159aeae36fe18ae65194ac36bcab844d5"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.139/phosphobot-0.2.139-x86_64.bin"
      sha256 "14f2941c63772315b19b9dc74a47995040919247c7e0478faf3e01131db8b980"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.139-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
