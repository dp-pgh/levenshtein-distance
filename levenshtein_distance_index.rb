#!/usr/bin/ruby

def levenshtein(a,b)
  n, m = a.length, b.length
  if n > m
    a,b = b,a
    n,m = m,n
  end

 current = (0..n).to_a # [0, 1, ... , n],
 # *(0..n) splat operator alternative for array coercion
 
  for i in 1..m 
    previous, current = current, [i] + [0]*n
    for j in 1..n
      add, delete = previous[j]+1, current[j-1]+1
      change = previous[j-1]
      if a[j-1] != b[i-1]
        change = change + 1
      end
      current[j] = [add, delete, change].min
    end
  end

  return current[n]
end
    
