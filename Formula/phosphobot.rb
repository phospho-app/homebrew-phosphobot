class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.98/phosphobot-arm64.bin"
      sha256 "00d146a93326dede41cbd0eb81e524860e24241ab73cfd06bc52cf43c10c8b52"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.98/phosphobot-x86_64.bin"
      sha256 "356db419de53b55d105c756123c34fb959f70cf00953c0036461080996372358"
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
