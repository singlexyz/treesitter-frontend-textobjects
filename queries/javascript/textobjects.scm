; declaration
([
  (lexical_declaration)
  (variable_declaration)
  (assignment_expression)
]) @declaration.outer
(variable_declarator value: (_) @declaration.inner)

; import
(import_statement
  (import_clause
    [(named_imports) (identifier)] @import.inner)) @import.outer

; jsx attributes
[(jsx_self_closing_element) (jsx_element)] @tag.outer
(jsx_element (_) @tag.inner)

; ((declaration
;   (property_name) . (_) @_start
;   (_)? @_end .)
;   (#make-range! "rhs.inner" @_start @_end)) @rhs.outer

; jsx attributes
(jsx_self_closing_element attribute: (_) @attribute.outer)
(jsx_self_closing_element attribute: (_ (string) @attribute.inner))
(jsx_self_closing_element attribute: (_ (jsx_expression (_) @attribute.inner)))

(jsx_element open_tag: (_ attribute: (_) @attribute.outer))
(jsx_element open_tag: (_ attribute: (_ (jsx_expression (_) @attribute.inner))))
(jsx_element open_tag: (_ attribute: (_ (string) @attribute.inner)))

; lhs && rhs
([(lexical_declaration) (variable_declaration)])
  (variable_declarator
    name: (_) @lhs.inner
    value: (_) @rhs.inner
) @lhs.outer @rhs.outer

(assignment_expression
  left: (_) @lhs.inner
  right: (_) @rhs.inner
) @lhs.outer @rhs.outer

; object key/value
(object
  (pair
    key: (_) @key.inner
    value: (_) @value.inner
  ) @key.outer @value.outer)

; function
(function_declaration body: (statement_block (_)? @function.inner)) @function.outer
(function body: (statement_block (_)? @function.inner)) @function.outer

(arrow_function body: (statement_block (_)? @function.inner)) @function.outer
(arrow_function body: (_) @function.inner) @function.outer

(export_statement
  (function_declaration) @function.outer) @function.outer.start

(method_definition
  body: (statement_block) @function.inner) @function.outer

(class_declaration
  body: (class_body) @class.inner) @class.outer

(export_statement
  (class_declaration) @class.outer) @class.outer.start

(for_in_statement
  body: (_)? @loop.inner) @loop.outer

(while_statement
  body: (_)? @loop.inner) @loop.outer

(do_statement
  body: (_)? @loop.inner) @loop.outer

(if_statement
  consequence: (_)? @conditional.inner
  alternative: (_)? @conditional.inner) @conditional.outer

(switch_statement
  body: (_)? @conditional.inner) @conditional.outer

(call_expression) @call.outer
((call_expression
  (arguments . (_) @_start
  (_)? @_end .))
  (#make-range! "call.inner" @_start @_end))

;; blocks
(_ (statement_block) @block.inner) @block.outer
