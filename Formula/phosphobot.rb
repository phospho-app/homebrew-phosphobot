class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.203"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.203/phosphobot-0.2.203-arm64.bin"
      sha256 "e48dceed48d3997f6290c9173330294039c6e10559f324b47856bc1df3e72efb"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.203/phosphobot-0.2.203-x86_64.bin"
      sha256 "29a4c01d262669fa6909c5243d0e53e5a9d12503018d90b87ab178a324407e09"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.203-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
