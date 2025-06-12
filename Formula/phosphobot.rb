class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.42"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.42/phosphobot-0.3.42-arm64.bin"
      sha256 "9824e94a33e72152e8aee072ed9d01b4935a0023f0c677d7b6387564b1535c70"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.42/phosphobot-0.3.42-x86_64.bin"
      sha256 "91478af30381018e3a6d9228f1b11c7f86696f75ccf66294f3931e841c68c86c"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.42-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
