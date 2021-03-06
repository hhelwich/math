
toApprox = (expected, actual, upper, maxEps = 0) ->
  if not expected.isSize(actual)
    return pass: false
  for c in [0...expected.columns] by 1
    for r in [0...(if upper then c+1 else expected.rows)] by 1
      dif = Math.abs actual.get(r, c) - expected.get(r, c)
      if not isFinite(dif) or dif > maxEps
        return pass: false
  pass: true


module.exports =

  # checks if actual matrix has the same size and all element number values are similar
  toApprox: (util, customEqualityTesters) ->
    compare: (actual, expected, maxEps = 0) ->
      toApprox expected, actual, false, maxEps

  toApproxUpper: (util, customEqualityTesters) ->
    compare: (actual, expected, maxEps = 0) ->
      toApprox expected, actual, true, maxEps
