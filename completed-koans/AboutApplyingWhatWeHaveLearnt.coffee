should = require('chai').should() # import Chai.js matchers
FILL_ME_IN = 'Fill this value in' # Don't touch this one!

describe 'About Applying What We Have Learnt', ->
  operations = [
    { direction: 'RT', distance: 200}
    { direction: 'FWD', distance: 50}
    { direction: 'RT', distance: 100}
    { direction: 'RT', distance: 20}
    { direction: 'FWD', distance: 200}
    { direction: 'RT', distance: 10}
  ]

  it 'should find a needle in a haystack (imperative)', ->
    findNeedle = (ops) ->
      hasInvalidOperation = false
      for i in [0..ops.length-1]
        if (ops[i].direction == 'FWD' && ops[i].distance > 100)
          hasInvalidOperation = true
          break
      return hasInvalidOperation

    findNeedle(operations).should.equal true

  it 'should find needle in a haystack (functional)', ->
    check_function= (x) ->
      if(x.direction == 'FWD' && x.distance > 100) then false else true
    findNeedle = (ops) ->
      if((x for x in ops when not check_function(x)).length > 0) then true else false


    findNeedle(operations).should.equal true

  it 'should add all the natural numbers below 1000 that are multiples of 3 or 5 (imperative)', ->
    total = 0
    for i in [1..1000]
      if (i % 3 == 0 || i % 5 == 0)
        total += i
    total.should.equal 234168

  it 'should add all the natural numbers below 1000 that are multiples of 3 or 5 (functional)', ->
    check = (x) ->
      if(x % 3 == 0 || x % 5 == 0) then true else false
    sum = (i, a) -> i + a
    my_function = ->
      (x for x in [1..1000] when check(x)).reduce sum
    my_function().should.equal 234168

  it 'should find the sum of all the even valued terms in the fibonacci sequence which do not exceed four million (imperative)', ->
    sum = 0
    fib = [0, 1, 1]
    i = 3
    currentFib = 0

    # Note, the condition in the while loop isn't strictly necessary, as the first fib
    # >4m is actually odd, but it is good practice for avoiding fencepost errors
    while (currentFib = fib[i] = fib[i-1] + fib[i-2]) < 4000000
      if (currentFib % 2 == 0)
        sum += currentFib
      i+=1

    sum.should.equal 4613732
  it 'should find the sum of all the even valued terms in the fibonacci sequence which do not exceed four million (functional)', ->
    fib = ->
      fib_arr = [0,1,1]
      i = 2
      while(fib_arr[i] < 4000000)
        fib_arr.push(fib_arr[i] + fib_arr[i-1])
        i += 1
      return fib_arr
    sum = (i, a) -> i + a


    my_func = ->
      (x for x in fib() when x % 2 == 0).reduce sum

    my_func().should.equal 4613732

###
# UNCOMMENT FOR EXTRA CREDIT
  it 'should find the largest prime factor of a composite number', ->

  it 'should find the largest palindrome made from the product of two 3 digit numbers', ->

  it 'should what is the smallest number divisible by each of the numbers 1 to 20', ->

  it 'should what is the difference between the sum of the squares and the square of the sums', ->

  it 'should find the 10001st prime', ->
###
