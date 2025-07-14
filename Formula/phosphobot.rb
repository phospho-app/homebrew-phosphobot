class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.57"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.57/phosphobot-0.3.57-arm64.bin"
      sha256 "97b503d0a4e0e2a7a7fbaee9809c5d6214c22227682a92e6959ce660d0903626"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.57/phosphobot-0.3.57-x86_64.bin"
      sha256 "45f57154e771d926e0ae59b504815436873c687e558027aa902715136a7c1508"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.57-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
