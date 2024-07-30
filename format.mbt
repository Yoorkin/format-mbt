/// Formats a string by replacing placeholders with the corresponding arguments.
///
/// # Arguments
///
/// - `format`: A string containing placeholders to be replaced.
/// - `args`: An array of values to be inserted into the placeholders.
///
/// # Returns
///
/// Returns the formatted string.
///
/// # Example
///
/// ```moonbit
/// let str = "Hello, {}! Today is {}."
/// let name = "Alice"
/// let day = "Monday"
/// println(format(str, [name, day])) // Output: "Hello, Alice! Today is Monday."
/// ```
pub fn format(format : String, args : Array[Show]) -> String {
  loop format.to_array()[:], args[:], "" {
    ['{', '}', .. as xs], [arg, .. as args], acc =>
      continue xs, args, acc + arg.to_string()
    ['{', '{' as esc, .. as xs] | ['}', '}' as esc, .. as xs], args, acc =>
      continue xs, args, acc + esc.to_string()
    [x, .. as xs], args, acc => continue xs, args, acc + x.to_string()
    [], [], acc => acc
    _, _, _ => abort("format error")
  }
}

/// # Example
///
/// ```moonbit
/// let name = "Alice"
/// let day = "Monday"
/// printf("Hello, {}! Today is {}.", [name, day]) // Output: "Hello, Alice! Today is Monday."
/// ```
pub fn printf(text : String, args : Array[Show]) -> Unit {
  println(format(text, args))
}
