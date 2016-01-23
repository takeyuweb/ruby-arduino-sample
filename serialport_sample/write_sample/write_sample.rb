# Arudino送信サンプル
# Arduinoへのシリアルポート入力でLEDを付けたり消したりするサンプル
#
# C:\Ruby22-x64\bin\ruby.exe -e $stdout.sync=true;$stderr.sync=true;load($0=ARGV.shift) C:/Users/Yuichi/IdeaProjects/Arduino/serialport_sample/write_sample/write_sample.rb
# "ON" or "OFF"
# INPUT> ON
# Turn on
# INPUT> OFF
# Turn off
# INPUT> ON
# Turn on
# INPUT> OFF
# Turn off
# INPUT>

require 'serialport'

port = 'COM3'
baud_rate = 9600

$stdout.sync = true

SerialPort.open(port, baud_rate) do |sp|
  puts '"ON" or "OFF"'
  print 'INPUT> '
  while input = readline
    input.chomp!
    case input
      when 'ON'
        puts 'Turn on'
        sp.write '1'
      when 'OFF'
        puts 'Turn off'
        sp.write '0'
      else
        puts 'Invalid'
    end
    print 'INPUT> '
  end
end
