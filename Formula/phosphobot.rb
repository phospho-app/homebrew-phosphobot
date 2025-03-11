class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.83/phosphobot-arm64.bin"
      sha256 "80d3038af360a90a15ab463c0c6bb28da31d6b6046ae791105abe5459d612268"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.83/phosphobot-x86_64.bin"
      sha256 "8badc7360787d83cff0e6963fab367c4e055a55c2ee98d92b39f938ecc31bd1e"
    end
  end
  
  def install
    bin_name = Hardware::CPU.arm? ? "phosphobot-arm64.bin" : "phosphobot-x86_64.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
