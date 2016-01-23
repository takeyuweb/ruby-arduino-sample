# Arudino受信サンプル
# Arduinoからのシリアルポート出力を受け取って表示するRubyスクリプトサンプル
#
# C:\Ruby22-x64\bin\ruby.exe -e $stdout.sync=true;$stderr.sync=true;load($0=ARGV.shift) C:/Users/Yuichi/IdeaProjects/Arduino/serialport_sample/sample.rb
# Count : 1
# Count : 2
# Count : 3
# Count : 4
# Count : 5
# Count : 6
# Count : 7
# Count : 8
# Count : 9
# Count : 10

require 'serialport'

port = 'COM3'
baud_rate = 9600

STDOUT.sync = true

SerialPort.open(port, baud_rate) do |sp|
  sp.read_timeout = 10
  loop do
    begin
      puts  sp.readline
    rescue EOFError
      retry
    end
  end
end
