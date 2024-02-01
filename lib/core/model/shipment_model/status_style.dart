class StatusStyle {
    String color;
    String modStyle;

    StatusStyle({
        required this.color,
        required this.modStyle,
    });

    factory StatusStyle.fromJson(Map<String, dynamic> json) => StatusStyle(
        color: json["color"],
        modStyle: json["mod_style"],
    );

    Map<String, dynamic> toJson() => {
        "color": color,
        "mod_style": modStyle,
    };
}
