class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.91/phosphobot-arm64.bin"
      sha256 "2b2bf5e0553d2ca6818cf8cfa982fd7b83b954de8be10b060af7e7da81239fc2"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.91/phosphobot-x86_64.bin"
      sha256 "0d585c87dbbb709cdbc0ed09e4ec64aa53d8911ccba991902388b0d4339798f2"
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
