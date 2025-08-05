class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.82"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.82/phosphobot-0.3.82-arm64.bin"
      sha256 "dc8606b88549d861f3de4607db5df35fb334a78c79fb1cc54f0ec43425a64e2f"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.82/phosphobot-0.3.82-x86_64.bin"
      sha256 "6b7153e1b7159934ed7b3dd4a845e71a7f057234f319f7c5f5e8becc199b8439"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.82-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
