class QuickFind
  attr_accessor :id

  def initialize(n)
    @id = []
    for i in 0..n
      id[i] = i
    end
  end

  def connected?(p, q)
    id[p] == id[q]
  end

  def union(p, q)
    pid = id[p]
    qid = id[q]
    for i in 0..id.length
      id[i] = qid if id[i] == pid
    end
  end
end
