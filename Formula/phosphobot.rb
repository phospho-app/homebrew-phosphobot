class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.3.89"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.89/phosphobot-0.3.89-arm64.bin"
      sha256 "7352815fa8ba9c605ced64129d4ad9bb9668a07b61b830d0fccf8c6399684707"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.3.89/phosphobot-0.3.89-x86_64.bin"
      sha256 "6b652d3d666a841c82a1ce87d97d7047e59b4f511f8d66f8a9819c3967a3965f"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.3.89-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
