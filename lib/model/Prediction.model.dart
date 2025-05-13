class Prediction {
  final int gearId;
  final int predictedFaultCode;
  final double predictedRulHours;
  final double confidence;

  Prediction({required this.gearId, required this.predictedFaultCode, required this.predictedRulHours, required this.confidence});
}