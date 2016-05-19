class WeightedQuickUnion
  attr_accessor :id, :sz

  def initialize(n)
    @id = []
    @sz = []
    for i in 0..n
      id[i] = i
      sz[i] = 1
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
    return if i == j
    if sz[i] < sz[j]
      id[i] = j
      sz[j] += sz[i]
    else
      id[j] = i
      sz[i] += sz[j]
    end
  end
end
