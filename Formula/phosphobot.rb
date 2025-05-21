class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.9"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.9/phosphobot-0.3.9-arm64.bin"
      sha256 "addf81036c1f24ba6e91b39937640f0f5762bd13d506a346e6179ac8c4c0dff3"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.9/phosphobot-0.3.9-x86_64.bin"
      sha256 "18338de091cb55c02e0ce6e2e4e67631adecad2e6bd035dce43d9a6c60748a2f"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.9-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
