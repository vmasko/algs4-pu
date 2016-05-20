require 'benchmark'
require './quick_find'
require './quick_union'
require './weighted_quick_union.rb'

class Runner
  TYPE = ARGV[0]
  SIZE = ARGV[1]
  attr_accessor :a, :n, :handler

  def initialize
    @n = read.first
    @a = read[1..-1]
    @handler = choose
  end

  def read
    File.read("tests/#{SIZE}UF.txt").split.map(&:to_i)
  end

  def choose
    return QuickFind.new(@n)  if TYPE == 'qf'
    return QuickUnion.new(@n) if TYPE == 'qu'
    WQuickUnion.new(@n)       if TYPE == 'wqu'
  end

  def test
    Benchmark.bm do |x|
      x.report { a.each_slice(2) { |i| handler.union(i[0], i[1]) } }
    end
  end
end

Runner.new.test
