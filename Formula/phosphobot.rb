class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.24"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.24/phosphobot-0.3.24-arm64.bin"
      sha256 "cb2627bfcbddefd9d1a5717eb83bd07080d5a26388a10df62cfcb456f4050102"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.24/phosphobot-0.3.24-x86_64.bin"
      sha256 "93a48ee22d7a6bc6ab4271bf89b7cde3a36a071c14dd8af2b04ebb03399dea62"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.24-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
