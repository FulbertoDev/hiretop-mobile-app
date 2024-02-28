enum InputType { text, password }

enum ButtonType { primary, outline }

enum DateFilter {
  lastWeek(label: "Semaine passée"),
  lastMonth(label: "Mois passé"),
  anytime(label: "Tout");

  final String label;
  const DateFilter({required this.label});
}
