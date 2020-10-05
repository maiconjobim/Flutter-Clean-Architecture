abstract class ErrorSearch implements Exception {}

class InvalidTextError implements ErrorSearch {}

class DatasourceError implements ErrorSearch {}

class EmptyList extends ErrorSearch {}
