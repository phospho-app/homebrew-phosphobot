class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.94/phosphobot-arm64.bin"
      sha256 "342c97dc18fbd62a50fe83227a0973f048bfbf8fc07da8ca309c9af1061f687c"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.94/phosphobot-x86_64.bin"
      sha256 "f47b97a675fed53bc97d0b1c322b3413da7c8c3af029af3add6cf6775041df8e"
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
