import 'package:base/features/domain/entities/admin.dart';
import 'package:base/features/domain/entities/agent.dart';
import 'package:base/features/domain/entities/deposit.dart';
import 'package:base/features/domain/entities/investor.dart';
import 'package:base/features/domain/entities/level.dart';

class InvestorDeposit {
  List<Deposit>? deposit;
  List<Level>? level;
  List<Admin>? admin;
  List<Agent>? agent;
  List<Invester>? invester;
  String? status;

  InvestorDeposit(
      {this.deposit,
        this.level,
        this.admin,
        this.agent,
        this.invester,
        this.status});

  InvestorDeposit.fromJson(Map<String, dynamic> json) {
    if (json['deposit'] != null) {
      deposit = <Deposit>[];
      json['deposit'].forEach((v) {
        deposit!.add(new Deposit.fromJson(v));
      });
    }
    if (json['level'] != null) {
      level = <Level>[];
      json['level'].forEach((v) {
        level!.add(new Level.fromJson(v));
      });
    }
    if (json['admin'] != null) {
      admin = <Admin>[];
      json['admin'].forEach((v) {
        admin!.add(new Admin.fromJson(v));
      });
    }
    if (json['agent'] != null) {
      agent = <Agent>[];
      json['agent'].forEach((v) {
        agent!.add(new Agent.fromJson(v));
      });
    }
    if (json['invester'] != null) {
      invester = <Invester>[];
      json['invester'].forEach((v) {
        invester!.add(new Invester.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deposit != null) {
      data['deposit'] = this.deposit!.map((v) => v.toJson()).toList();
    }
    if (this.level != null) {
      data['level'] = this.level!.map((v) => v.toJson()).toList();
    }
    if (this.admin != null) {
      data['admin'] = this.admin!.map((v) => v.toJson()).toList();
    }
    if (this.agent != null) {
      data['agent'] = this.agent!.map((v) => v.toJson()).toList();
    }
    if (this.invester != null) {
      data['invester'] = this.invester!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}
