# RESULT OF JOIN (node "list", preset default)
list = [ 1, 2, 3, [ 1, 2 ], %{:bar => 1} ]

# RESULT OF SPLIT (node "list", preset default)
list = [
  1,
  2,
  3,
  [ 1, 2 ],
  %{:bar => 1},
]

# RESULT OF JOIN (node "map", preset default)
map = %{ :foo => "foo", :bar => 'bar', [ 1, 2 ] => 2 }

# RESULT OF SPLIT (node "map", preset default)
map = %{
  :foo => "foo",
  :bar => 'bar',
  [ 1, 2 ] => 2
}

# RESULT OF JOIN (node "method_parameters", preset default)
def test(a, b) do end

# RESULT OF SPLIT (node "method_parameters", preset default)
def test(
  a,
  b
) do end

# RESULT OF JOIN (node "argument_list", preset default)
test(a, b)

# RESULT OF SPLIT (node "argument_list", preset default)
test(
  a,
  b
)

# RESULT OF JOIN (node "sigil", preset default)
~w(foo bar baz)

# RESULT OF split (node "sigil", preset default)
~w(
  foo
  bar
  baz
)

# RESULT OF JOIN (node "body_statement", preset default)
def double(x), do: IO.inspect("func");  x * 2

# RESULT OF JOIN (node "body_statement", preset default)
  def double(x) 
  IO.inspect("meth")
  x * 2
end

# RESULT OF JOIN (node "do_block to block", preset default)
x.each { |y| puts y }

# RESULT OF SPLIT (node "block to do_block", preset default)
x.each do |y|
  puts y
end

# RESULT OF JOIN (node "if_modifier to if", preset default)
return false if true

# RESULT OF SPLIT (node "if to if_modifier", preset default)
if true
  return false
end

# RESULT OF JOIN (node "conditional to if", preset default)
cond ? do_that('cond') : do_this('not nond')

# RESULT OF SPLIT (node "if to conditional", preset default)
if cond
  do_that('cond')
else
  do_this('not nond')
end

# RESULT OF JOIN (node "conditional to if", preset default)
cond ? do_that('cond') : do_this('not nond')

# RESULT OF SPLIT (node "if to conditional", preset default)
if cond
  do_that('cond')
else
  do_this('not nond')
end

# RESULT OF JOIN (node "when", preset default)
case
when true then print('false')
end

# RESULT OF SPLIT (node "when", preset default)
case
when true
  print('false')
end

# RESULT OF JOIN (field "right" inside "operator_assignment", preset default)
def config
  @config ||= method
end

# RESULT OF SPLIT (field "right" inside "operator_assignment", preset default)
def config
  @config ||= begin
    method
  end
end

# RESULT OF JOIN (node "unless_modifier to unless", preset default)
return false unless true

# RESULT OF SPLIT (node "unless to unless_modifier", preset default)
unless true
  return false
end

# RESULT OF JOIN (node "conditional to unless", preset default)
cond ? do_that('cond') : do_this('not nond')

# RESULT OF SPLIT (node "unless to conditional", preset default)
unless cond
  do_this('not nond')
else
  do_that('cond')
end
