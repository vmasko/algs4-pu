class ThreeSum

  def count(a)
    n = a.length
    count = 0
    i = 0
    while i < n
      j = i + 1
      while j < n
        k = j + 1
        while k < n
          count += 1 if a[i] + a[j] + a[k] == 0
          k += 1
        end
        j += 1
      end
      i += 1
    end
    puts "Result: #{count}."
  end
end
