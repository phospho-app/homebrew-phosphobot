class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.35"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.35/phosphobot-0.3.35-arm64.bin"
      sha256 "3a470c8cefacceaacfb9d3e28160298a785e5b0bfc77b6aca7ec97a20cb718ca"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.35/phosphobot-0.3.35-x86_64.bin"
      sha256 "f6a512c86c0f6be22feb110142618aa06c92f4a6d82b07cde1d0cf68b558eb9d"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.35-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
