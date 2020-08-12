extension SpaceTrim on String {
  List<String> spaceTrim() {
    var text = this.trim().replaceAll(" ", "");
    String operation;
    var fouroperations = ["+", "-", "*", "/"];
    fouroperations.forEach((element) {
      if (text.contains(element)) {
        operation = element;
      }
    });
    var nums = text.split(operation);
    return [nums[0], operation, nums[1]];
  }
}
