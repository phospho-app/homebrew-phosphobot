class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.156"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.156/phosphobot-0.2.156-arm64.bin"
      sha256 "eb67d960e4e2b1ff0a42ca2c8c00e18494afde6a34c411f1f6284a7183bd1262"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.156/phosphobot-0.2.156-x86_64.bin"
      sha256 "3e195ff89995b964bf6b5f640928442ba1e1a87e91fb62ead1699405cdef326a"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.156-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
