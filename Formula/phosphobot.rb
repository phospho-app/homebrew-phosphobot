class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.110"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.110/phosphobot-0.2.110-arm64.bin"
      sha256 "e286de814c12a060577eda5035900b7a790d20a18407871c5256e2453022bff8"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.110/phosphobot-0.2.110-x86_64.bin"
      sha256 "0f15d592a5f5e7a3db48dec58329911e597112878d2eac9648928edc73049dc0"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.110-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
