abstract class Failure implements Exception {}

class InvalidNumberNullError implements Failure {}

class InvalidTextError implements Failure {}

class EmptyList extends Failure {}

class ErrorSearch extends Failure {}

class DatasourceResultNull implements Failure {}
