abstract class DTO<From, To> {
  final From from;
  const DTO(this.from);
  To convert();
}
