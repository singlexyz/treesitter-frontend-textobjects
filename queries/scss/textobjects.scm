(rule_set (block) @rule.inner) @rule.outer
(declaration) @declaration.outer

(rule_set
  (selectors) @lhs.inner
  (block) @rhs.inner
)

(declaration
  (property_name) @lhs.inner
)

((declaration
  (property_name) . (_) @_start
  (_)? @_end .)
  (#make-range! "rhs.inner" @_start @_end))
