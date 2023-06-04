<template>
  <div>
    <div class="container">
      <div class="login-form" style="backgroundColor:rgba(192, 192, 192, 0.53);borderRadius:10px">
        <h1 class="h1" style="color:rgba(255, 255, 255, 1);fontSize:28px;margin-bottom: 30px">
          四六级在线报考系统注册</h1>
        <el-form ref="rgsForm" class="rgs-form" :model="rgsForm" label-width="120px">
          <el-form-item label="账号" class="input" v-if="tableName=='yonghu'">
            <el-input v-model="ruleForm.zhanghao" autocomplete="off" placeholder="账号" type="text"/>
          </el-form-item>
          <el-form-item label="密码" class="input" v-if="tableName=='yonghu'">
            <el-input v-model="ruleForm.mima" autocomplete="off" placeholder="密码" type="text"/>
          </el-form-item>
          <el-form-item label="姓名" class="input" v-if="tableName=='yonghu'">
            <el-input v-model="ruleForm.xingming" autocomplete="off" placeholder="姓名" type="text"/>
          </el-form-item>
          <el-form-item label="年龄" class="input" v-if="tableName=='yonghu'">
            <el-input v-model="ruleForm.nianling" autocomplete="off" placeholder="年龄" type="text"/>
          </el-form-item>
          <el-form-item label="电话" class="input" v-if="tableName=='yonghu'">
            <el-input v-model="ruleForm.dianhua" autocomplete="off" placeholder="电话" type="text"/>
          </el-form-item>
          <el-form-item label="邮箱" class="input" v-if="tableName=='yonghu'">
            <el-input v-model="ruleForm.youxiang" autocomplete="off" placeholder="邮箱" type="text"/>
          </el-form-item>
          <el-form-item label="身份证" class="input" v-if="tableName=='yonghu'">
            <el-input v-model="ruleForm.shenfenzheng" autocomplete="off" placeholder="身份证" type="text"/>
          </el-form-item>
          <el-button class="btn" type="primary" @click="login()">注册</el-button>
        </el-form>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      ruleForm: {},
      tableName: "",
      rules: {}
    };
  },
  mounted() {
    let table = this.$storage.get("loginTable");
    this.tableName = table;
  },
  methods: {
    // 获取uuid
    getUUID() {
      return new Date().getTime();
    },
    // 注册
    login() {
      if ((!this.ruleForm.zhanghao) && `yonghu` == this.tableName) {
        this.$message.error(`账号不能为空`);
        return
      }
      if ((!this.ruleForm.mima) && `yonghu` == this.tableName) {
        this.$message.error(`密码不能为空`);
        return
      }
      if ((!this.ruleForm.xingming) && `yonghu` == this.tableName) {
        this.$message.error(`姓名不能为空`);
        return
      }
      if (`yonghu` == this.tableName && this.ruleForm.nianling && (!this.$validate.isIntNumer(this.ruleForm.nianling))) {
        this.$message.error(`年龄应输入整数`);
        return
      }
      if (`yonghu` == this.tableName && this.ruleForm.dianhua && (!this.$validate.isMobile(this.ruleForm.dianhua))) {
        this.$message.error(`电话应输入手机格式`);
        return
      }
      if (`yonghu` == this.tableName && this.ruleForm.youxiang && (!this.$validate.isEmail(this.ruleForm.youxiang))) {
        this.$message.error(`邮箱应输入邮件格式`);
        return
      }
      if (`yonghu` == this.tableName && this.ruleForm.shenfenzheng && (!this.$validate.checkIdCard(this.ruleForm.shenfenzheng))) {
        this.$message.error(`身份证应输入身份证格式`);
        return
      }
      this.$http({
        url: `${this.tableName}/register`,
        method: "post",
        data: this.ruleForm
      }).then(({data}) => {
        if (data && data.code === 0) {
          this.$message({
            message: "注册成功",
            type: "success",
            duration: 1500,
            onClose: () => {
              this.$router.replace({path: "/login"});
            }
          });
        } else {
          this.$message.error(data.msg);
        }
      });
    }
  }
};
</script>
<style lang="scss" scoped>
.el-radio__input.is-checked .el-radio__inner {
  border-color: #00c292;
  background: #00c292;
}

.el-radio__input.is-checked .el-radio__inner {
  border-color: #00c292;
  background: #00c292;
}

.el-radio__input.is-checked .el-radio__inner {
  border-color: #00c292;
  background: #00c292;
}

.el-radio__input.is-checked + .el-radio__label {
  color: #00c292;
}

.el-radio__input.is-checked + .el-radio__label {
  color: #00c292;
}

.el-radio__input.is-checked + .el-radio__label {
  color: #00c292;
}

.h1 {
  margin-top: 10px;
}

body {
  padding: 0;
  margin: 0;
}

.nk-navigation {
  margin-top: 15px;

  a {
    display: inline-block;
    color: #fff;
    background: rgba(255, 255, 255, .2);
    width: 100px;
    height: 50px;
    border-radius: 30px;
    text-align: center;
    display: flex;
    align-items: center;
    margin: 0 auto;
    justify-content: center;
    padding: 0 20px;
  }

  .icon {
    margin-left: 10px;
    width: 30px;
    height: 30px;
  }
}

.register-container {
  margin-top: 10px;

  a {
    display: inline-block;
    color: #fff;
    max-width: 500px;
    height: 50px;
    border-radius: 30px;
    text-align: center;
    display: flex;
    align-items: center;
    margin: 0 auto;
    justify-content: center;
    padding: 0 20px;

    div {
      margin-left: 10px;
    }
  }
}

.container {
  background-image: url("https://s2.loli.net/2023/06/04/LkA5UbwhuOlHrTy.png");
  height: 100vh;
  background-position: center center;
  background-size: cover;
  background-repeat: no-repeat;

  .login-form {
    right: 50%;
    top: 50%;
    height: auto;
    transform: translate3d(50%, -50%, 0);
    border-radius: 10px;
    background-color: rgba(255, 255, 255, .5);
    width: 420px;
    padding: 30px 30px 40px 30px;
    font-size: 14px;
    font-weight: 500;

    .h1 {
      margin: 0;
      text-align: center;
      line-height: 54px;
      font-size: 24px;
      color: #000;
    }

    .rgs-form {
      display: flex;
      flex-direction: column;
      justify-content: center;
      //align-items: center;

      .input {
        width: 100%;

        & /deep/ .el-form-item__label {
          line-height: 40px;
          color: rgba(105, 105, 105, 1);
          font-size: 16px;
          font-weight: bold;
          padding-right: 40px;
        }

        & /deep/ .el-input__inner {
          height: 40px;
          color: #606266;
          font-size: 14px;
          border-width: 0px;
          border-style: solid;
          border-color: #606266;
          border-radius: 4px;
          background-color: #fff;
        }
      }

      .btn {
        width: 200px;
        height: 44px;
        color: #fff;
        font-size: 14px;
        border-width: 0px;
        border-style: solid;
        border-color: #409EFF;
        border-radius: 4px;
        background-color: rgba(0, 206, 209, 0.64);
        margin: 0 auto;
      }
    }
  }
}
</style>
