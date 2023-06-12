import 'package:base/features/domain/entities/admin.dart';
import 'package:base/features/domain/entities/agent.dart';
import 'package:base/features/domain/entities/authuser.dart';
import 'package:base/features/domain/entities/investor.dart';
import 'package:base/features/domain/entities/level.dart';
import 'package:base/features/domain/entities/withdraw.dart';

class InvestorWithdraw {
  List<Withdraw>? withdraw;
  AuthUser? authUser;
  List<Level>? level;
  List<Admin>? admin;
  List<Agent>? agent;
  List<Invester>? invester;
  String? status;

  InvestorWithdraw(
      {this.withdraw,
        this.authUser,
        this.level,
        this.admin,
        this.agent,
        this.invester,
        this.status});

  InvestorWithdraw.fromJson(Map<String, dynamic> json) {
    if (json['withdraw'] != null) {
      withdraw = <Withdraw>[];
      json['withdraw'].forEach((v) {
        withdraw!.add(new Withdraw.fromJson(v));
      });
    }
    authUser = json['auth_user'] != null
        ? new AuthUser.fromJson(json['auth_user'])
        : null;
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
    if (this.withdraw != null) {
      data['withdraw'] = this.withdraw!.map((v) => v.toJson()).toList();
    }
    if (this.authUser != null) {
      data['auth_user'] = this.authUser!.toJson();
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