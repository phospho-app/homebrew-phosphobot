class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.0"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.0/phosphobot-0.3.0-arm64.bin"
      sha256 "068b6774f673209978dd85d94e498dca8c505f84d49f2f1c311c268d49d66c28"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.0/phosphobot-0.3.0-x86_64.bin"
      sha256 "ed6860dbafd8422b3e8340a000b73f58a9689183d8a7cd557d49fa1f9583c79f"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.0-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
