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


func isSquare(n: int): bool =
  # Returns `true`
  let root = integerSqrt(n)
  return root*root == n


when isMainModule:
  # integerSqrt
  var root: int
  for i in 0..1000:
    root = integerSqrt(i)
    doAssert root*root <= i
    doAssert i < (root + 1)*(root + 1)

  # isSquare
  var count = 0
  for i in 0..1000:
    if isSquare(i):
      count += 1
  doAssert count == 32
