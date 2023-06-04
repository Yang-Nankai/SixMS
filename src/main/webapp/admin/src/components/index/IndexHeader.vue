<template>
  <div class="navbar"
       :style="{backgroundColor:heads.headBgColor,height:heads.headHeight,boxShadow:heads.headBoxShadow,lineHeight:heads.headHeight}">
    <div class="right-menu">
      <div class="user-info" :style="{color:heads.headUserInfoFontColor,fontSize:heads.headUserInfoFontSize}">
        {{ this.$storage.get('role') }} {{ this.$storage.get('adminName') }}
      </div>
      <div class="logout" :style="{color:heads.headLogoutFontColor,fontSize:heads.headLogoutFontSize}"
           @click="onLogout">退出登录
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      dialogVisible: false,
      ruleForm: {},
      user: {},
      heads: {
        "headLogoutFontHoverColor": "#fff",
        "headFontSize": "20px",
        "headUserInfoFontColor": "#333",
        "headBoxShadow": "",
        "headTitleImgHeight": "44px",
        "headLogoutFontHoverBgColor": "#333",
        "headFontColor": "#000",
        "headTitleImg": false,
        "headHeight": "60px",
        "headTitleImgBorderRadius": "22px",
        "headTitleImgUrl": "http://codegen.caihongy.cn/20201021/cc7d45d9c8164b58b18351764eba9be1.jpg",
        "headBgColor": "#F5F6FA",
        "headTitleImgBoxShadow": "0 1px 6px #444",
        "headLogoutFontColor": "#333",
        "headUserInfoFontSize": "16px",
        "headTitleImgWidth": "44px",
        "headTitleStyle": "1",
        "headLogoutFontSize": "16px"
      },
    };
  },
  created() {
    this.setHeaderStyle()
  },
  mounted() {
    let sessionTable = this.$storage.get("sessionTable")
    this.$http({
      url: sessionTable + '/session',
      method: "get"
    }).then(({
               data
             }) => {
      if (data && data.code === 0) {
        this.user = data.data;
      } else {
        let message = this.$message
        message.error(data.msg);
      }
    });
  },
  methods: {
    onLogout() {
      let storage = this.$storage
      let router = this.$router
      storage.remove("Token");
      router.replace({
        name: "login"
      });
    },
    onIndexTap() {
      window.location.href = `${this.$base.indexUrl}`
    },
    setHeaderStyle() {
      this.$nextTick(() => {
        document.querySelectorAll('.navbar .right-menu .logout').forEach(el => {
          el.addEventListener("mouseenter", e => {
            e.stopPropagation()
            el.style.backgroundColor = this.heads.headLogoutFontHoverBgColor
            el.style.color = this.heads.headLogoutFontHoverColor
          })
          el.addEventListener("mouseleave", e => {
            e.stopPropagation()
            el.style.backgroundColor = "transparent"
            el.style.color = this.heads.headLogoutFontColor
          })
        })
      })
    },
  }
};
</script>


<style lang="scss" scoped>
.navbar {
  height: 60px;
  line-height: 60px;
  width: 100%;
  padding: 0 34px;
  box-sizing: border-box;
  background-color: #ff00ff;
  position: relative;
  z-index: 111;

  .right-menu {
    position: absolute;
    right: 34px;
    top: 4px;
    height: 100%;
    display: flex;
    justify-content: flex-end;
    align-items: center;
    z-index: 111;

    .user-info {
      font-size: 16px;
      color: red;
      padding: 0 12px;
    }

    .logout {
      font-size: 16px;
      color: red;
      padding: 0 12px;
      cursor: pointer;
      font-weight: 700;
    }
  }
}
</style>
