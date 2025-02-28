class Phosphobot < Formula
  desc "Phosphobot teleop application for robot control"
  homepage "https://github.com/phospho-app/phosphobot"
  url "https://github.com/phospho-app/homebrew-phosphobot/releases/download/0.2.74/phosphobot.bin"
  sha256 "585899a3133f8a4121afbad1b860311cf1d08655c8cba3c35c865681f1fdad2d"
  license "MIT"

  def install
    chmod "+x", "phosphobot.bin"
    bin.install "phosphobot.bin" => "phosphobot"
  end

  test do
    system "#{bin}/phosphobot", "--version"
  end
end
