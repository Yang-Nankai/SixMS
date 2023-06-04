let menu;
menu = {
    list() {
        return [{
            "backMenu": [{
                "child": [{
                    "buttons": ["新增", "查看", "修改", "删除"],
                    "menu": "用户",
                    "menuJump": "列表",
                    "tableName": "yonghu"
                }], "menu": "用户管理"
            }, {
                "child": [{
                    "buttons": ["新增", "查看", "修改", "删除"],
                    "menu": "教师",
                    "menuJump": "列表",
                    "tableName": "teacher"
                }], "menu": "教师管理"
            }, {
                "child": [{
                    "buttons": ["新增", "查看", "修改", "删除", "报表"],
                    "menu": "考试成绩",
                    "menuJump": "列表",
                    "tableName": "kaoshichengji"
                }], "menu": "考试成绩管理"
            }, {
                "child": [{
                    "buttons": ["新增", "查看", "修改", "删除"],
                    "menu": "公告通知",
                    "menuJump": "列表",
                    "tableName": "gonggaotongzhi"
                }], "menu": "公告通知管理"
            }, {
                "child": [{
                    "buttons": ["新增", "查看", "修改", "删除"],
                    "menu": "考生通知",
                    "menuJump": "列表",
                    "tableName": "kaoshengtongzhi"
                }], "menu": "考生通知管理"
            }, {
                "child": [{
                    "buttons": ["新增", "查看", "修改", "删除"],
                    "menu": "试题管理",
                    "tableName": "examquestion"
                }], "menu": "试题管理"
            }, {
                "child": [{"buttons": ["新增", "查看", "修改", "删除"], "menu": "试卷管理", "tableName": "exampaper"}],
                "menu": "试卷管理"
            }, {
                "child": [{
                    "buttons": ["查看", "修改", "删除"],
                    "menu": "考试记录",
                    "tableName": "examrecord"
                }, {"buttons": ["查看", "修改", "删除"], "menu": "试卷列表", "tableName": "exampaperlist"}],
                "menu": "考试管理"
            }],
            "frontMenu": [],
            "hasBackLogin": "是",
            "hasBackRegister": "否",
            "hasFrontLogin": "否",
            "hasFrontRegister": "否",
            "roleName": "管理员",
            "tableName": "users"
        }, {
            "backMenu": [{
                "child": [{
                    "buttons": ["查看", "报表"],
                    "menu": "考试成绩",
                    "menuJump": "列表",
                    "tableName": "kaoshichengji"
                }], "menu": "考试成绩管理"
            }, {
                "child": [{"buttons": ["查看"], "menu": "公告通知", "menuJump": "列表", "tableName": "gonggaotongzhi"}],
                "menu": "公告通知管理"
            }, {
                "child": [{
                    "buttons": ["查看"],
                    "menu": "考生通知",
                    "menuJump": "列表",
                    "tableName": "kaoshengtongzhi"
                }], "menu": "考生通知管理"
            }, {
                "child": [{
                    "buttons": ["查看"],
                    "menu": "错题本",
                    "tableName": "examfailrecord"
                }, {
                    "buttons": ["查看"],
                    "menu": "试卷列表",
                    "tableName": "exampaperlist"
                }, {
                    "buttons": ["查看"],
                    "menu": "考试记录",
                    "tableName": "examrecord"
                }],
                "menu": "考试管理"
            }],
            "frontMenu": [],
            "hasBackLogin": "是",
            "hasBackRegister": "是",
            "hasFrontLogin": "否",
            "hasFrontRegister": "否",
            "roleName": "用户",
            "tableName": "yonghu"
        }, {
            "backMenu": [{
                "child": [{
                    "buttons": ["查看", "报表"],
                    "menu": "考试成绩",
                    "menuJump": "列表",
                    "tableName": "kaoshichengji"
                }], "menu": "考试成绩管理"
            }, {
                "child": [{"buttons": ["查看"], "menu": "公告通知", "menuJump": "列表", "tableName": "gonggaotongzhi"}],
                "menu": "公告通知管理"
            }, {
                "child": [{
                    "buttons": ["查看"],
                    "menu": "考生通知",
                    "menuJump": "列表",
                    "tableName": "kaoshengtongzhi"
                }], "menu": "考生通知管理"
            }, {
                "child": [{
                    "buttons": ["查看"],
                    "menu": "试卷列表",
                    "tableName": "exampaperlist"
                }], "menu": "考试管理"
            }],
            "frontMenu": [],
            "hasBackLogin": "是",
            "hasBackRegister": "是",
            "hasFrontLogin": "否",
            "hasFrontRegister": "否",
            "roleName": "教师",
            "tableName": "teacher"
        }]
    }
};
export default menu;
