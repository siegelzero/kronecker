func primes(n: int): seq[int] =
  doAssert n > 2
  let m = n div 3
  let offset = if n mod 6 > 1: 1 else: 0
  var
    bits = newSeq[bool](m +  1)
    i: int
    a = 0
    k = 1
    t = 2

  for i in 1..m:
    bits[i] = true

  i = 1
  while i*i <= m:
    k = 3 - k
    a += 4*k*i
    t += 4*k
    if bits[i]:
      for j in countup(a, m, t):
        bits[j] = false
      for j in countup(a + 2*i*(3 - k) + 1, m, t):
        bits[j] = false
    i += 1

  result.add(2)
  result.add(3)
  for i in 0..(m - offset):
    if bits[i]:
      result.add((3*i + 1) or 1)

