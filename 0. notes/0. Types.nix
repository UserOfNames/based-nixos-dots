# Strings are as expected
"Hello world"
''Hello world''
"
  This is the first line.
  The indetations are stripped from the start of these lines.
  To be exact, it strips the number of spaces equal to the minimal indentation of the string as a whole
    So this double indented line would have one indentation.
"

a = "interpolated"
"This string is ${a}"

# Numbers can be ints or floats
4, 4.5

# Paths are paths. They must contain at least one slash to be recognized.
/this/is/a/path

# Booleans are the standard. Null is null.
True
False
null

# Lists are enclose in [] and contain elements. Lists are lazy in values but strict in length. Elements are accessed through builtins.elemAt
list = [ 123 ./foo.nix "abc" (f { x = y; }) ] # Contains a function as the fourth element. Must be enclosed in parentheses.
builtins.elemAt list 0 # Evaluates to 123

# An attribute set is a collection of name-value pairs called attributes. Enclosed by {}. An attribute name may be an identifier or string. Names and values are separated by an equal sign.
# Each value is an arbitrary expression terminated by a semicolon. Attributes may appear in any order, but an attribute name may only occur once. Use the . operator to access attributes.
set = {
  x = 123;
  text = "Hello";
  y = f {bla = 456; };
}
set.text # Evaluates to "Hello"

# To provide a default selection, use 'or'
{ a = "Foo"; b = "Bar"; }.c or "Xyzzy" # Evalutes to "Xyzzy" since there is no c attribute
