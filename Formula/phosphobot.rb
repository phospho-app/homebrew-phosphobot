class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  license "MIT"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.81/phosphobot-arm64.bin"
      sha256 "9dfaaded21a048b28d769f37f10f62be1cb8221f31589d694d8b60c9de6661ba"
    else
      url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.81/phosphobot-x86_64.bin"
      sha256 "224b7c9bf87a975e90e5903b199d06e0ac1545d30825d6f92ba00b0c6da26562"
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
