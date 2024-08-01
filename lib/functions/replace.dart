String replaceEverything(String text) {
  return text.replaceAll("/", "_").replaceAll(" ", "_").replaceAll("#", "_");
}
