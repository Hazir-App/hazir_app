abstract class DTO<From, To> {
  final From from;
  DTO(this.from);
  To toModel();
}
