List<String> dogAge = List.generate(30, (index) => '${index + 1}');


//List<T> List.generate(int length, T Function(int index) generator)
// length: 생성할 리스트의 길이입니다.
// generator: 각 인덱스에 대해 호출되는 함수로, 인덱스를 인자로 받아 해당 인덱스에 대한 값을 반환합니다.