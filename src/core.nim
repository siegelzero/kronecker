import std/bitops


func integerSqrt(n: int): int =
  doAssert n >= 0
  if n <= 1: return n

  let bits = fastLog2(n)
  var
    x, y: int

  x = 1 shl ((bits shr 1) + 1)

  while true:
    y = (x + n div x) shr 1
    if y >= x: return x
    x = y


when isMainModule:
  var root: int
  for i in 0..10000:
    root = integerSqrt(i)
    doAssert root*root <= i
    doAssert i < (root + 1)*(root + 1)

