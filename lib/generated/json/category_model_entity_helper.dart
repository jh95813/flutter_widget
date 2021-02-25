import 'package:flutter_widget/model/category_model_entity.dart';

categoryModelEntityFromJson(CategoryModelEntity data, Map<String, dynamic> json) {
	if (json['label'] != null) {
		data.label = json['label'].toString();
	}
	if (json['value'] != null) {
		data.value = json['value'].toString();
	}
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	return data;
}

Map<String, dynamic> categoryModelEntityToJson(CategoryModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['label'] = entity.label;
	data['value'] = entity.value;
	data['icon'] = entity.icon;
	return data;
}