
# Effective Dart guide
We adhere to the style that is established by the **[Dart standard](https://dart.dev/guides/language/effective-dart#documentation)**

#### For successful work, you need to read everything about style in the documentation. Below you can find a summary and some rules without explanation that can only be a reminder (or a cheat sheet) later


The guidelines split into a few separate pages for easy digestion:

  * **[Style Guide](https://dart.dev/guides/language/effective-dart/style)** &ndash; This defines the rules for laying out and
    organizing code, or at least the parts that [dartfmt] doesn't handle for
    you. The style guide also specifies how identifiers are formatted:
    `camelCase`, `using_underscores`, etc.

  * **[Documentation Guide](https://dart.dev/guides/language/effective-dart/documentation)** &ndash; This tells you everything you need to
    know about what goes inside comments. Both doc comments and regular,
    run-of-the-mill code comments.

  * **[Usage Guide](https://dart.dev/guides/language/effective-dart/usage)** &ndash; This teaches you how to make the best use of
    language features to implement behavior. If it's in a statement or
    expression, it's covered here.

  * **[Design Guide](https://dart.dev/guides/language/effective-dart/design)** &ndash; This is the softest guide, but the one
    with the widest scope. It covers what we've learned about designing
    consistent, usable APIs for libraries. If it's in a type signature or
    declaration, this goes over it.

## How to read the guides

Each guide is broken into a few sections. Sections contain a list of guidelines.
Each guideline starts with one of these words:

* **DO** guidelines describe practices that should always be followed. There
  will almost never be a valid reason to stray from them.

* **DON'T** guidelines are the converse: things that are almost never a good
  idea. Hopefully, we don't have as many of these as other languages do because
  we have less historical baggage.

* **PREFER** guidelines are practices that you *should* follow. However, there
  may be circumstances where it makes sense to do otherwise. Just make sure you
  understand the full implications of ignoring the guideline when you do.

* **AVOID** guidelines are the dual to "prefer": stuff you shouldn't do but
  where there may be good reasons to on rare occasions.

* **CONSIDER** guidelines are practices that you might or might not want to
  follow, depending on circumstances, precedents, and your own preference.

## Summary of all rules

## Style

### Identifiers
* **DO** name types using UpperCamelCase.
* **DO** name extensions using UpperCamelCase.
* **DO** name libraries, packages, directories, and source files using lowercase_with_underscores.
* **DO** name import prefixes using lowercase_with_underscores.
* **DO** name other identifiers using lowerCamelCase.
* **PREFER** using lowerCamelCase for constant names.
* **DO** capitalize acronyms and abbreviations longer than two letters like words.
* **PREFER** using _, __, etc. for unused callback parameters.
* **DON’T** use a leading underscore for identifiers that aren’t private.
* **DON’T** use prefix letters.

### Ordering
* **DO** place “dart:” imports before other imports.
* **DO** place “package:” imports before relative imports.
* **DO** specify exports in a separate section after all imports.
* **DO** sort sections alphabetically.

### Formatting
* **DO** format your code using dartfmt.
* **CONSIDER** changing your code to make it more formatter-friendly.
* **AVOID** lines longer than 80 characters.
* **DO** use curly braces for all flow control statements.

## Documentation

### Comments
* **DO** format comments like sentences.
* **DON’T** use block comments for documentation.
* **PREFER** brevity.
* **AVOID** abbreviations and acronyms unless they are obvious.
* **DO** use prose to explain parameters, return values, and exceptions.
Other languages use verbose tags and sections to describe what the parameters and returns of a method are.

_**BAD:**_
```
 Defines a flag with the given name and abbreviation.

 @param name The name of the flag.
 @param abbr The abbreviation for the flag.
 @returns The new flag.
 @throws ArgumentError If there is already an option with the given name or abbreviation. 
 
Flag addFlag(String name, String abbr) => ...
The convention in Dart is to integrate that into the description of the method and highlight parameters using square brackets.
```
_**GOOD:**_
```
 Defines a flag.

Throws an [ArgumentError] if there is already an option named [name] or
there is already an option using abbreviation [abbr]. Returns the new flag.

Flag addFlag(String name, String abbr) => ...
```
## Usage

### Libraries
* **DO** use strings in part of directives.
* **DON’T** import libraries that are inside the src directory of another package.
* **DO** use relative paths when importing libraries within your own package’s lib directory.

### Booleans
* **DO** use ?? to convert null to a boolean value.
Both operations produce the same result and do the right thing, but ?? is preferred for three main reasons:

The ?? operator clearly signals that the code has something to do with a null value.

The == true looks like a common new programmer mistake where the equality operator is redundant and can be removed. That’s true when the boolean expression on the left will not produce null, but not when it can.

The ?? false and ?? true clearly show what value will be used when the expression is null. With == true, you have to think through the boolean logic to realize that means that a null gets converted to false.

### Strings
* **DO** use adjacent strings to concatenate string literals.
If you have two string literals—not values, but the actual quoted literal form—you do not need to use + to concatenate them. Just like in C and C++, simply placing them next to each other does it. This is a good way to make a single long string that doesn’t fit on one line.
* **PREFER** using interpolation to compose strings and values.
```
'Hello, $name! You are ${year - birth} years old.';
```
* **AVOID** using curly braces in interpolation when not needed.

### Collections
* **DO** use collection literals when possible.
* **DON’T** use .length to see if a collection is empty.
* **CONSIDER** using higher-order methods to transform a sequence.
* **AVOID** using Iterable.forEach() with a function literal.
* **DON’T** use List.from() unless you intend to change the type of the result.
* **DO** use whereType() to filter a collection by type.
* **DON’T** use cast() when a nearby operation will do.
* **AVOID** using cast().

### Functions
* **DO** use a function declaration to bind a function to a name.
* **DON’T** create a lambda when a tear-off will do.

### Parameters
* **DO** use = to separate a named parameter from its default value.
* **DON’T** use an explicit default value of null.

### Variables
* **DON’T** explicitly initialize variables to null.
* **AVOID** storing what you can calculate.

### Members
* **DON’T** wrap a field in a getter and setter unnecessarily.
* **PREFER** using a final field to make a read-only property.
* **CONSIDER** using => for simple members.
* **DON’T** use this. except to redirect to a named constructor or to avoid shadowing.
* **DO** initialize fields at their declaration when possible.

### Constructors
* **DO** use initializing formals when possible.
* **DON’T** type annotate initializing formals.
* **DO** use ; instead of {} for empty constructor bodies.
* **DON’T** use new.
* **DON’T** use const redundantly.

### Error handling
* **AVOID** catches without on clauses.
* **DON’T** discard errors from catches without on clauses.
* **DO** throw objects that implement Error only for programmatic errors.
* **DON’T** explicitly catch Error or types that implement it.
* **DO** use rethrow to rethrow a caught exception.

### Asynchrony
* **PREFER** async/await over using raw futures.
* **DON’T** use async when it has no useful effect.
* **CONSIDER** using higher-order methods to transform a stream.
* **AVOID** using Completer directly.
* **DO** test for Future<T> when disambiguating a FutureOr<T> whose type argument could be Object.

## Design

### Names
* **DO** use terms consistently.
* **AVOID** abbreviations.
* **PREFER** putting the most descriptive noun last.
* **CONSIDER** making the code read like a sentence.
* **PREFER** a noun phrase for a non-boolean property or variable.
* **PREFER** a non-imperative verb phrase for a boolean property or variable.
* **CONSIDER** omitting the verb for a named boolean parameter.
* **PREFER** the “positive” name for a boolean property or variable.
* **PREFER** an imperative verb phrase for a function or method whose main purpose is a side effect.
* **PREFER** a noun phrase or non-imperative verb phrase for a function or method if returning a value is its primary purpose.
* **CONSIDER** an imperative verb phrase for a function or method if you want to draw attention to the work it performs.
* **AVOID** starting a method name with get.
* **PREFER** naming a method to___() if it copies the object’s state to a new object.
* **PREFER** naming a method as___() if it returns a different representation backed by the original object.
* **AVOID** describing the parameters in the function’s or method’s name.
* **DO** follow existing mnemonic conventions when naming type parameters.

### Libraries
* **PREFER** making declarations private.
* **CONSIDER** declaring multiple classes in the same library.
* **AVOID** defining a one-member abstract class when a simple function will do.
* **AVOID** defining a class that contains only static members.
* **AVOID** extending a class that isn’t intended to be subclassed.
* **DO** document if your class supports being extended.
* **AVOID** implementing a class that isn’t intended to be an interface.
* **DO** document if your class supports being used as an interface.
* **DO** use mixin to define a mixin type.
* **AVOID** mixing in a type that isn’t intended to be a mixin.

### Constructors
* **CONSIDER** making your constructor const if the class supports it.

### Members
* **PREFER** making fields and top-level variables final.
* **DO** use getters for operations that conceptually access properties.
* **DO** use setters for operations that conceptually change properties.
* **DON’T** define a setter without a corresponding getter.
* **AVOID** returning null from members whose return type is bool, double, int, or num.
* **AVOID** returning this from methods just to enable a fluent interface.

### Types
* **PREFER** type annotating public fields and top-level variables if the type isn’t obvious.
* **CONSIDER** type annotating private fields and top-level variables if the type isn’t obvious.
* **AVOID** type annotating initialized local variables.
* **AVOID** annotating inferred parameter types on function expressions.
* **AVOID** redundant type arguments on generic invocations.
* **DO** annotate when Dart infers the wrong type.
* **PREFER** annotating with dynamic instead of letting inference fail.
* **PREFER** signatures in function type annotations.
* **DON’T** specify a return type for a setter.
* **DON’T** use the legacy typedef syntax.
* **PREFER** inline function types over typedefs.
* **CONSIDER** using function type syntax for parameters.
* **AVOID** using dynamic unless you want to disable static checking.
* **DO** use Future<void> as the return type of asynchronous members that do not produce values.
* **AVOID** using FutureOr<T> as a return type.

### Parameters
* **AVOID** positional boolean parameters.
* **AVOID** optional positional parameters if the user may want to omit earlier parameters.
* **AVOID** mandatory parameters that accept a special “no argument” value.
* **DO** use inclusive start and exclusive end parameters to accept a range.

### Equality
* **DO** override hashCode if you override ==.
* **DO** make your == operator obey the mathematical rules of equality.
* **AVOID** defining custom equality for mutable classes.
* **DON’T** check for null in custom == operators.
