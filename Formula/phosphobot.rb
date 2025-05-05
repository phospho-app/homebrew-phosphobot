class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  version "0.2.193"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.193/phosphobot-0.2.193-arm64.bin"
      sha256 "d7f975c6d2e14b84b3cc25681bdef9f140b0da1bb7c60bcf2843be6f12a58357"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/v0.2.193/phosphobot-0.2.193-x86_64.bin"
      sha256 "dba7522e599d8eeffbe240da0e4a0c5e8bb33177e2ea6b6ab6c2d9c3734c58eb"
    end
  end
  
  def install
    arch = Hardware::CPU.arm? ? "arm64" : "x86_64"
    bin_name = "phosphobot-0.2.193-#{arch}.bin"
    chmod "+x", bin_name
    bin.install bin_name => "phosphobot"
  end
  
  test do
    system "#{bin}/phosphobot", "--version"
  end
end
