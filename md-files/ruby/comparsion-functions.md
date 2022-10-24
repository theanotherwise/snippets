|           |  nil? |         empty?         |      any?     |     zero?     |    nonzero?   | blank? | present? (!blank?) |
|:---------:|:-----:|:----------------------:|:-------------:|:-------------:|:-------------:|:------:|:------------------:|
|           |  Ruby |                        |               |               |               |  Rails |                    |
|           |  All  | Strings, Arrays, Hashs |   Enumerable  |  Numericable  |               |   All  |                    |
|    nil    |  TRUE |      NoMethodError     | NoMethodError | NoMethodError | NoMethodError |  TRUE  |        FALSE       |
|   false   | FALSE |      NoMethodError     | NoMethodError | NoMethodError | NoMethodError |  TRUE  |        FALSE       |
|    true   | FALSE |      NoMethodError     | NoMethodError | NoMethodError | NoMethodError |  FALSE |        TRUE        |
|     0     | FALSE |      NoMethodError     | NoMethodError |      TRUE     |     FALSE     |  FALSE |        TRUE        |
|     1     | FALSE |      NoMethodError     | NoMethodError |     FALSE     |      TRUE     |  FALSE |        TRUE        |
|     "     | FALSE |          TRUE          | NoMethodError | NoMethodError | NoMethodError |  TRUE  |        FALSE       |
|    " "    | FALSE |          FALSE         | NoMethodError | NoMethodError | NoMethodError |  TRUE  |        FALSE       |
|     []    | FALSE |          TRUE          |     FALSE     | NoMethodError | NoMethodError |  TRUE  |        FALSE       |
|   [nil]   | FALSE |          FALSE         |     FALSE     | NoMethodError | NoMethodError |  FALSE |        TRUE        |
|     {}    | FALSE |          TRUE          |     FALSE     | NoMethodError | NoMethodError |  TRUE  |        FALSE       |
| {nil:nil} | FALSE |          FALSE         |      TRUE     | NoMethodError | NoMethodError |  FALSE |        TRUE        |
