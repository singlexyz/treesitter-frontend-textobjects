(rule_set
  (block
    "{" . (_) @_start
    (_)?
  @_end "}")
  (#make-range! "rule.inner" @_start @_end)
) @rule.outer

(declaration) @declaration.inner
(declaration) @declaration.outer

(declaration
  (property_name) @lhs.inner
) @lhs.outer

((declaration
  (property_name) . (_) @_start
  (_)? @_end .)
  (#make-range! "rhs.inner" @_start @_end)) @rhs.outer
