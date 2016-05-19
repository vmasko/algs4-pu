class QuickUnion
  attr_accessor :id

  def initialize(n)
    @id = []
    for i in 0..n
      id[i] = i
    end
  end

  def root(i)
    while i != id[i]
      i = id[i]
    end
    i
  end

  def connected?(p, q)
    root(p) == root(q)
  end

  def union(p, q)
    i = root(p)
    j = root(q)
    id[i] = j
  end
end
