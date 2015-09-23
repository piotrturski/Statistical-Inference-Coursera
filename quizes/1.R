## Q1
any_parent <- .17
father <- .12
both_parents <- .06

# p(a or b) = p(a) + p(b) - p(a and b)
# p(a or b) - p(b) + p(a and b)= p(a)

mother <- any_parent - father + both_parents

## Q5
# positive predictive value = P(D | +)
# P(pregnant | positive) = P(positive | pregnant) * P(pregnant) / P(positive)
# sensitivity = P(+ | D) = .75
# specificity = P(- | ~D) = .52
# prevelance = P(D) = .3

sensitivity <- .75
specificity <- .52
prevelance <- .3


# P(positive) = P(+ | D)* P(D) + P(+ | ~D)*P(~D)
# P(+ | ~D) = 1 - P(- | ~D)

# P(+ | D) * P(D) / ( P(+|D)*P(D) + (1 - P(-|~D) ) * P(~D) ) =
ppv <- sensitivity * prevelance / (sensitivity * prevelance + (1 - specificity)*(1 - prevelance)) 
