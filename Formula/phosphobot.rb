class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.96/phosphobot-arm64.bin"
      sha256 "e593ce0e56a0e5b27c5cafd9cc1449302031fefcb031cf85e8011e0a3ae393b1"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.96/phosphobot-x86_64.bin"
      sha256 "510ee2073b1d44a9fd1795a8868fcc70bcfcf4d736c4fda45462feafc9dc9d0f"
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
