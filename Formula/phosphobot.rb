class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.40"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.40/phosphobot-0.3.40-arm64.bin"
      sha256 "d2dd8d527a1c247fdd8110f6a0c5f5266549593eccc65e78cac9b06051292730"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.40/phosphobot-0.3.40-x86_64.bin"
      sha256 "9f76f6513332fcfe13f88be455c9446c141ab52a0cd851cd6ae873b781901b12"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.40-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
