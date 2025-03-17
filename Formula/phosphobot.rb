class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.88/phosphobot-arm64.bin"
      sha256 "91bab733d040fb805c1ab4d5b5ab60074d7ee32419943427adc6929870da822d"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.88/phosphobot-x86_64.bin"
      sha256 "369e907c132a539091d4460dae336ea0c760b1644ccf1d91580a41d08e1df149"
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
