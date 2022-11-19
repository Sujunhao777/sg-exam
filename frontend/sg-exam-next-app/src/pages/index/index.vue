<template>
  <div class="container">
    <swiper
        style="height: calc(100vh - 56px);"
        :indicator-dots="true"
        indicator-color="#fae37c"
        indicator-active-color="rgba(250, 227, 124, 0.2)"
    >
      <swiper-item v-for="(item,index) in items" :key="index">
        <div class="item">
          <img :src="item.icon"/>
          <div class="title">{{ item.title }}</div>
          <div class="des">{{ item.des }}</div>
          <view class="tenant-code-input">
            <at-input :value="tenantCode" @change="handleTenantCode" title="企业ID" placeholder="非必填" :border="false"></at-input>
          </view>
          <view class="login-btn">
            <at-button circle type="primary" size="normal" @click="getUserProfile">
              <at-icon value='message' size="12"></at-icon>
              微信登录
            </at-button>
            <at-button circle type="primary" class="login-btn-item" size="normal" @click="handlePhoneLogin">
              <at-icon value='phone' size="12"></at-icon>
              手机号登录
            </at-button>
          </view>
        </div>
      </swiper-item>
    </swiper>
  </div>
  <section class="input"></section>
</template>
<script lang="ts">
import {ref, unref} from 'vue';
import Taro from "@tarojs/taro"
import api from "../../api/api";
import authApi from "../../api/auth.api";
import userApi from "../../api/user.api";
import studySvg from "../../assert/study_v3.svg";
import {shardMessage, TENANT_CODE} from "../../constant/constant";

export default {
  setup() {
    const tenantCode = ref<string>("");

    function handleTenantCode(value) {
      tenantCode.value = value;
    }

    // 用户授权登录
    async function getUserProfile() {
      wx.getUserProfile({
        desc: '用于完善用户资料',
        success: (res) => {
          const {userInfo} = res;
          const {nickName, gender, avatarUrl} = userInfo;
          Taro.showLoading({title: '登录中'})
          Taro.login({
            success: async (data) => {
              if (tenantCode.value === '') {
                handleTenantCode(TENANT_CODE);
              }
              const {code} = data;
              const loginResult = await authApi.wxlogin(unref(tenantCode), code, {name: nickName, gender, avatarUrl});
              if (loginResult.code === 0 && loginResult.result) {
                api.setTenantCode(loginResult.result.tenantCode);
                api.setToken(loginResult.result.token);
                const {result} = await userApi.userInfo();
                api.setUserInfo(result);
                Taro.showToast({title: '登录成功'});
                Taro.reLaunch({url: "/pages/home/index"})
              } else {
                Taro.showToast({title: '登录失败'});
              }
              Taro.hideLoading();
            },
            fail: () => {
              Taro.showToast({title: '登录失败'});
            },
            timeout: () => {
              Taro.showToast({title: '登录超时'});
            }
          })
        },
        fail: () => {
          Taro.showToast({title: '授权失败'});
        }
      });
    }

    const items = [
      {
        title: 'HI，欢迎使用云面试',
        des: '提供面试、考试、练习、问卷等功能',
        icon: studySvg
      }
    ]

    const showAuthorizeBtn = ref<boolean>(false);

    function handlePhoneLogin() {
      Taro.navigateTo({url: "/pages/login/index"})
    }

    return {items, showAuthorizeBtn, tenantCode, handleTenantCode, getUserProfile, handlePhoneLogin}
  },
  onShareAppMessage() {
    return shardMessage;
  },
  async onShareTimeline() {
    return shardMessage;
  }
}
</script>
<style lang="less">
.cut-btn {
  border-radius: 50px;
}

swiper {
  swiper-item {
    display: flex;
    align-items: center;
    justify-content: center;

    .item {
      text-align: center;
      padding-bottom: 40 rpx;

      image {
        width: 500 rpx;
        height: 650 rpx;
      }

      .title {
        font-size: 36 rpx;
        font-weight: bold;
        margin: 10 rpx 0 rpx;
      }

      .des {
        font-size: 28 rpx;
        color: #969696;
        margin-bottom: 20 rpx;
      }
    }
  }
}

.login-btn {
  display: inline-flex;
}

.login-btn-item {
  margin-left: 12px;
}

.tenant-code-input {
  margin-bottom: 16px;
}
</style>