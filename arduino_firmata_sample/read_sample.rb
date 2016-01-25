# Arudino受信サンプル
# スイッチの押し下げ回数を arduino_firmata gem でカウントする
#
# C:\Ruby22-x64\bin\ruby.exe -e $stdout.sync=true;$stderr.sync=true;load($0=ARGV.shift) C:/Users/Yuichi/IdeaProjects/Arduino/arduino_firmata_sample/read_sample/read_sample.rb
# Count : 1
# Count : 2
# Count : 3
# Count : 4
# Count : 5

require 'arduino_firmata'

PORT = 'COM3'
SWITCH_SOCKET = 2

arduino = ArduinoFirmata.connect(PORT)
arduino.pin_mode(SWITCH_SOCKET, ArduinoFirmata::INPUT)

$stdout.sync = true
count = 0
loop do
  if arduino.digital_read(SWITCH_SOCKET)
    count = count.succ
    puts "Count : #{count}"
    while arduino.digital_read(SWITCH_SOCKET)
      sleep 0.1
    end
  end
end
