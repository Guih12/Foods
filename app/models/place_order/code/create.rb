module PlaceOrder
  module Code
    RAND_NUMBERS = 1..1000
    SPLIT = 5
    LENGTH = 5

    private_constant :RAND_NUMBERS, :SPLIT, :LENGTH

    Create = -> {
      Base32::Crockford.encode(rand(RAND_NUMBERS), split: SPLIT, length: LENGTH)
    }
  end
end