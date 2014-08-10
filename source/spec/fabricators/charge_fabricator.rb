Fabricator(:charge) do
  amount { rand(10000) + 1 }
  currency { %w(usd cents).sample }
end