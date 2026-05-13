object StringProcessor {
  // ИЗМЕНЕНО: убраны var и цикл for.
  // Используем filter + map — чистые функции без побочных эффектов.
  // filter оставляет только строки длиннее 3 символов,
  // map преобразует каждую оставшуюся строку в верхний регистр.
  def processStrings(strings: List[String]): List[String] =
    strings.filter(_.length > 3).map(_.toUpperCase)

  def main(args: Array[String]): Unit = {
    val strings = List("apple", "cat", "banana", "dog", "elephant")
    val processedStrings = processStrings(strings)
    println(s"Processed strings: $processedStrings")
  }
}