class DetectionResultModel {
  final String label;
  final double benignProb;
  final double melanomProb;
  final double confidence;
  final bool isMelanoma;
  DetectionResultModel(
      {required this.label,
      required this.benignProb,
      required this.melanomProb,
      required this.isMelanoma}): confidence = isMelanoma ? melanomProb : benignProb;
}
