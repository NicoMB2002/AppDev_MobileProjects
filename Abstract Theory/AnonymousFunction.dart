void main() {
  var words = ['sky', 'cloud', 'forest', 'welcome'];

  words.forEach((String word) {
    print('$word has ${word.length} characters');
  });
}