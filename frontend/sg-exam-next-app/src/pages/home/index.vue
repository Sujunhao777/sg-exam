<template>
  <AtMessage/>
  <view>
    <at-search-bar :value="searchValue" @action-click="handleSearch" @change="handleSearchChange" placeholder="云面试"/>
    <view class="banner-swiper-view">
      <swiper
          class='banner-swiper'
          indicatorColor='#999'
          indicatorActiveColor='#333'
          current='current'
          duration='500'
          interval='5000'
          circular='false'
          autoplay='false'
          indicatorDots='true'>
        <swiper-item v-for="(item, idx) in bannerUrls" :key="idx">
          <image :src="item" class="banner-swiper-image" />
        </swiper-item>
      </swiper>
    </view>
  </view>
  <view class="exam-view">
    <at-tabs :tab-list="tagsList" :current="current" @click="handleTabClick" color="rgb(7, 193, 96)">
      <at-tabs-pane title="考试">
        <view class="exam-item flex-col" v-for="item in exams">
          <exam-item :item="item" @start="handleStart"></exam-item>
        </view>
      </at-tabs-pane>
      <at-tabs-pane title="练习">
        <view class="exam-item flex-col" v-for="item in exams">
          <exam-item :item="item" @start="handleStart"></exam-item>
        </view>
      </at-tabs-pane>
      <at-tabs-pane title="问卷">
        <view class="exam-item flex-col" v-for="item in exams">
          <exam-item :item="item" @start="handleStart"></exam-item>
        </view>
      </at-tabs-pane>
      <at-tabs-pane title="面试">
        <view class="exam-item flex-col" v-for="item in exams">
          <exam-item :item="item" @start="handleStart"></exam-item>
        </view>
      </at-tabs-pane>
    </at-tabs>

    <at-load-more :status="loadMoreStatus" moreBtnStyle="size=5px;"></at-load-more>
    <at-modal :isOpened="isOpenedStartModal" title="" confirm-text="确定" cancel-text="取消"
              content="确定开始吗？"
              @close="handleCloseStartModal"
              @cancel="handleCancelStartModal"
              @confirm="handleConfirmStartModal"
    ></at-modal>
  </view>
</template>
<script lang="ts">
import {onMounted, ref, unref} from 'vue';
import api from "../../api/api";
import examApi from '../../api/exam.api';
import operationApi from '../../api/operation.api';
import Taro from "@tarojs/taro";
import {ExamItem} from '../../components/exam-item';
import {examTypeTagList, shardMessage} from '../../constant/constant';
import {filterLogin} from "../../utils/filter";

export default {
  components: {
    'exam-item': ExamItem
  },
  onLoad() {
    filterLogin();
  },
  setup() {
    const current = ref<number>(0);
    let exams = ref<any>([]);
    let searchValue = ref<string>("");
    const hasNextPageRef = ref<boolean>(true);
    const nextPageRef = ref<number>(1);

    const isOpenedStartModal = ref<boolean>(false);
    const startItem = ref<any>(undefined);
    const loadMoreStatus = ref<string>('more');

    const bannerUrls = ref<any>([]);

    // 运营位图片
    async function fetchBanners() {
     const res = await operationApi.bannerList();
     const { code, result } = res;
     if (code == 0 && result && result.list) {
       const imageUrls = [];
       result.list.forEach(e => {
         imageUrls.push(e.imageUrl);
       });
       bannerUrls.value = imageUrls;
     }
    }

    async function fetch(type, examinationName = "", append = true) {
      if (!unref(hasNextPageRef)) {
        loadMoreStatus.value = 'noMore';
        return;
      }
      if (loadMoreStatus.value === 'loading') {
        return;
      }
      loadMoreStatus.value = 'loading';
      try {
        // 查询启用的考试
        const examinationList = await examApi.examinationList({
          type,
          examinationName,
          status: 0,
          page: unref(nextPageRef),
          favorite: '1'
        });
        const {code, result} = examinationList
        if (code === 0) {
          const {list, hasNextPage, nextPage} = result;
          if (append) {
            exams.value = [...exams.value, ...list];
          } else {
            exams.value = list;
          }
          hasNextPageRef.value = hasNextPage;
          nextPageRef.value = nextPage;
        }
      } finally {
        loadMoreStatus.value = hasNextPageRef.value ? 'more' : 'noMore';
      }
    }

    function handleStart(item) {
      isOpenedStartModal.value = true;
      startItem.value = item;
    }

    function handleCloseStartModal() {
      isOpenedStartModal.value = false;
    }

    function handleCancelStartModal() {
      isOpenedStartModal.value = false;
    }

    async function handleConfirmStartModal() {
      try {
        await Taro.showLoading({title: '加载中'});
        const {id} = api.getUserInfo();
        if (!id) {
          Taro.showToast({title: '请先登录', icon: 'error', duration: 1500});
          return;
        }
        const startResult = await examApi.startExam(unref(startItem).id, id);
        if (startResult && startResult.code === 1) {
          Taro.showToast({title: startResult.message, icon: 'error', duration: 1500});
          return;
        }
        const {code, result, message} = startResult;
        if (code !== 0) {
          Taro.showToast({title: message, icon: 'error', duration: 1500});
          return;
        }
        const {examination, examRecord, subjectDto, total, cards} = result;
        if (examination) {
          api.setExamination(examination);
        }
        if (subjectDto) {
          api.setSubject(subjectDto);
        }
        if (cards) {
          api.setCards(cards);
        }
        if (examRecord) {
          api.setExamRecord(examRecord);
        }
        const {answerType} = examination;
        if (answerType === 0) {
          // 展示所有题目
          Taro.navigateTo({url: "/pages/all_subject/index?recordId=" + examRecord.id + "&examinationId=" + examRecord.examinationId + "&total=" + total})
        } else if (answerType === 1) {
          // 上一题、下一题模式
          Taro.navigateTo({url: "/pages/next_subject/index?recordId=" + examRecord.id + "&examinationId=" + examRecord.examinationId + "&total=" + total})
        }
      } finally {
        handleCloseStartModal();
        await Taro.hideLoading();
      }
    }

    function handleTabClick(value) {
      current.value = value;
      searchValue.value = "";
      resetList();
      resetPage();
      resetLoadMoreStatus();
      fetch(value);
    }

    function handleSearchChange(value) {
      searchValue.value = value;
    }

    function handleSearch() {
      resetList();
      resetPage();
      fetch(unref(current), unref(searchValue), false);
    }

    function resetPage() {
      hasNextPageRef.value = true;
      nextPageRef.value = 1;
    }

    function resetList() {
      exams.value = [];
    }

    function resetLoadMoreStatus() {
      loadMoreStatus.value = 'more';
    }

    onMounted(() => {
      fetchBanners();
      fetch(unref(current));
    });

    return {
      loadMoreStatus,
      tagsList: examTypeTagList,
      current,
      searchValue,
      isOpenedStartModal,
      handleCloseStartModal,
      handleCancelStartModal,
      handleConfirmStartModal,
      handleStart,
      handleTabClick,
      handleSearchChange,
      handleSearch,
      exams,
      fetch,
      resetList,
      resetPage,
      resetLoadMoreStatus,
      hasNextPageRef,
      nextPageRef,
      bannerUrls
    };
  },
  onPullDownRefresh() {
    try {
      this.resetPage();
      this.resetList();
      this.fetch(unref(this.current), '', false);
    } finally {
      Taro.stopPullDownRefresh();
    }
  },
  onReachBottom() {
    try {
      this.fetch(unref(this.current));
    } finally {
      Taro.stopPullDownRefresh();
    }
  },
  onShareAppMessage() {
    return shardMessage;
  },
  async onShareTimeline() {
    return shardMessage;
  }
}
</script>

<style>
page {
  background: #EEF0F0;
}
.flex-col {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.exam-item {
  margin: 8px 10px 8px 10px;
  background: white;
  border-radius: 6px;
  overflow: hidden;
  position: relative;
}

.at-modal__content {
  min-height: 50px;
}

.banner-swiper-view {
  background-color: #FFF;
}

.banner-swiper {
  width: 100%;
  height: 120px;
  margin-bottom: 4px;
}
.banner-swiper-image {
  width: 100%;
  overflow: hidden;
}
</style>