test "format" {
  let person = "Joe"
  let id = 23
  inspect!(
    @fmt.format("Hi {}, your id is {}.", [person, id]),
    content="Hi Joe, your id is 23.",
  )
  inspect!(@fmt.format("test {{}}", []), content="test {}")
}
