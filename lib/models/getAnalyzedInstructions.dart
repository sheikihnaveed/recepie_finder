

import 'dart:convert';

List<GetAnalyzedInstructions> getAnalyzedInstructionsFromJson(String str) => List<GetAnalyzedInstructions>.from(json.decode(str).map((x) => GetAnalyzedInstructions.fromJson(x)));

String getAnalyzedInstructionsToJson(List<GetAnalyzedInstructions> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAnalyzedInstructions {
  final String name;
  final List<Step> steps;

  GetAnalyzedInstructions({
    required this.name,
    required this.steps,
  });

  factory GetAnalyzedInstructions.fromJson(Map<String, dynamic> json) => GetAnalyzedInstructions(
    name: json["name"],
    steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
  };
}

class Step {
  final int number;
  final String step;

  Step({
    required this.number,
    required this.step,
  });

  factory Step.fromJson(Map<String, dynamic> json) => Step(
    number: json["number"],
    step: json["step"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "step": step,
  };
}
