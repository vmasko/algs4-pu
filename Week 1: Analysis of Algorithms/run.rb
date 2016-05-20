# $ ruby run.rb 1k
# $ Result: 70.
# $ ruby run.rb 2k
# $ Result: 528.
# $ ruby run.rb 4k
# $ Result: 4039.

require 'benchmark'
require './three_sum'

class Runner
  SIZE = ARGV[0]
  attr_accessor :handler, :a

  def initialize
    @a = read
    @handler = ThreeSum.new
  end

  def read
    File.read("tests/#{SIZE}ints.txt").split.map(&:to_i)
  end

  def test
    Benchmark.bm do |x|
      x.report { handler.count(a) }
    end
  end
end

Runner.new.test
