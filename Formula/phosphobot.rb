class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.79"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.79/phosphobot-0.3.79-arm64.bin"
      sha256 "7b4b956bd9d66c1b4472018eec0d3f8180af5142430bcd64d18b1c22ae0aaef8"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.79/phosphobot-0.3.79-x86_64.bin"
      sha256 "929f961bf8694e8ca41f8ba80fc3fc90efbb45361d2d04070e92e6b6a9be6362"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.79-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
