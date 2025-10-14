class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.133"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.133/phosphobot-0.3.133-arm64.bin"
      sha256 "5a03fc8dbdfdacea5871b7c37a78fb69c171495e0454f580e60a3494f6755baf"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.133/phosphobot-0.3.133-x86_64.bin"
      sha256 "19614292ec66278ecfaed5dcd8c1c5692f638de65885e5c22a7fa21d848a6130"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.133-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
