require 'matrix'

def step_func(vect)
  vect.map{ |x| x >= 0 ? 1 : -1 }
end

def print_vector(vect, count)
  Math.sqrt(count).to_i.times do |t|
    puts (vect.to_a.first)[t*4..t*4+3].map { |i| i == 1 ? 'W' : ' '  }.join()
  end
  puts '=' * Math.sqrt(count).to_i
end

learn_base = []

examples = File.open('examples/3_4_2.txt', 'r').each_line do |line|
  learn_base << Matrix[line.chomp.split(', ').map{ |s| s.to_i }]
end
examples.close

count = learn_base.first.column_count

searc = File.open('examples/3_4_2_subs.txt', 'r')
y = Matrix[searc.gets.chomp.split(', ').map{ |s| s.to_i }]
searc.close

w = Matrix.zero(count)

learn_base.each do |x|
  w += x.transpose * x
  print_vector(x, count)
end

puts
puts

puts learn_base.include? res = step_func(w * y.transpose).transpose
puts 'Searchen'
puts '--------'
print_vector(y, count)
puts 'Rebuild to'
puts '----------'
print_vector(res, count)
