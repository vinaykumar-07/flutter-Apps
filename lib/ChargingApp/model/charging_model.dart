// To parse this JSON data, do

//     final chargingModel = chargingModelFromJson(jsonString);

import 'dart:convert';

List<ChargingModel> chargingModelFromJson(String str) => List<ChargingModel>.from(json.decode(str).map((x) => ChargingModel.fromJson(x)));

String chargingModelToJson(List<ChargingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChargingModel {
    String id;
    String evseGroupId;
    String uid;
    String evseId;
    String status;
    List<Connector> connectors;
    Coordinates? coordinates;
    String evseName;

    ChargingModel({
        required this.id,
        required this.evseGroupId,
        required this.uid,
        required this.evseId,
        required this.status,
        required this.connectors,
        this.coordinates,
        required this.evseName,
    });

    factory ChargingModel.fromJson(Map<String, dynamic> json) => ChargingModel(
        id: json["id"],
        evseGroupId: json["evse_group_id"],
        uid: json["uid"],
        evseId: json["evse_id"],
        status: json["status"],
        connectors: List<Connector>.from(json["connectors"].map((x) => Connector.fromJson(x))),
        coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
        evseName: json["evse_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "evse_group_id": evseGroupId,
        "uid": uid,
        "evse_id": evseId,
        "status": status,
        "connectors": List<dynamic>.from(connectors.map((x) => x.toJson())),
        "coordinates": coordinates?.toJson(),
        "evse_name": evseName,
    };
}

class Connector {
    double maxAmperage;
    String standard;
    String format;
    int? minAmperage;
    double maxVoltage;
    String id;
    int maxElectricPower;
    String powerType;
    List<String> tariffIds;
    String status;
    String? termsAndConditions;

    Connector({
        required this.maxAmperage,
        required this.standard,
        required this.format,
        this.minAmperage,
        required this.maxVoltage,
        required this.id,
        required this.maxElectricPower,
        required this.powerType,
        required this.tariffIds,
        required this.status,
        this.termsAndConditions,
    });

    factory Connector.fromJson(Map<String, dynamic> json) => Connector(
        maxAmperage: json["max_amperage"]?.toDouble(),
        standard: json["standard"],
        format: json["format"],
        minAmperage: json["min_amperage"],
        maxVoltage: json["max_voltage"]?.toDouble(),
        id: json["id"],
        maxElectricPower: json["max_electric_power"],
        powerType: json["power_type"],
        tariffIds: List<String>.from(json["tariff_ids"].map((x) => x)),
        status: json["status"],
        termsAndConditions: json["terms_and_conditions"],
    );

    Map<String, dynamic> toJson() => {
        "max_amperage": maxAmperage,
        "standard": standard,
        "format": format,
        "min_amperage": minAmperage,
        "max_voltage": maxVoltage,
        "id": id,
        "max_electric_power": maxElectricPower,
        "power_type": powerType,
        "tariff_ids": List<dynamic>.from(tariffIds.map((x) => x)),
        "status": status,
        "terms_and_conditions": termsAndConditions,
    };
}

class Coordinates {
    double latitude;
    double longitude;

    Coordinates({
        required this.latitude,
        required this.longitude,
    });

    factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}
