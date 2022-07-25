/* 
A condition is based off an indicator
*/
abstract class IndicatorType {}

class Price extends IndicatorType {}

class Rsi extends IndicatorType {}

/*
Operators used to create a condition
*/
abstract class OperatorType {}

class LessThanEQ extends OperatorType {}

class GreaterThanEQ extends OperatorType {}
