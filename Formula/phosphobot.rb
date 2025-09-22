class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.125"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.125/phosphobot-0.3.125-arm64.bin"
      sha256 "f7d212491002f8deb8647ed5d9f3dd0b594a3319b02d1e6c4074a384ef9a8246"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.125/phosphobot-0.3.125-x86_64.bin"
      sha256 "a5ec3557f5e68e53a5a8644f682fee7039ef677dfdded42f28e94d0ec01e7405"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.125-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
