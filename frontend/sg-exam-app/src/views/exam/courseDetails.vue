<template>
  <div>
    <transition name="el-fade-in">
      <div v-show="!loading">
        <div class="single-course-intro d-flex align-items-center justify-content-center"
             :style="'background-image: url(' + course.imageUrl + ');'">
          <div class="single-course-intro-content text-center">
            <div class="rate">
              <el-rate
                v-model="course.level"
                disabled
                text-color="#ff9900">
              </el-rate>
            </div>
            <h3>{{ course.courseName }}</h3>
            <div class="meta d-flex align-items-center justify-content-center"
                 v-if="course.college">
              <a href="#">{{ course.teacher }}</a>
              <span><i class="fa fa-circle" aria-hidden="true"></i></span>
              <a href="#">{{ course.college }} &amp; {{ course.major }}</a>
            </div>
            <div class="price">{{ course.chargeType === 1 ? '收费' : '免费' }}
              <h6 v-if="course.chargePrice > 0">{{ course.chargePrice }}</h6>
            </div>
          </div>
        </div>
        <div class="single-course-content padding-80">
          <el-row class="my-content-container ml-100 mr-100">
            <el-col :span="18" style="padding-right: 40px;">
              <el-tabs v-model="activeName" @tab-click="handleClick">
                <el-tab-pane name="desc">
                  <span slot="label">
                    <el-button type="default" class="course-content-btn">课程介绍</el-button>
                  </span>
                  <div class="clever-description">
                    <div class="about-course mb-30">
                      <h4>课程介绍</h4>
                      <p v-html="course.courseDescription"></p>
                    </div>
                  </div>
                </el-tab-pane>
                <el-tab-pane name="chapter">
                  <span slot="label">
                    <el-button type="default" class="course-content-btn">课程章节</el-button>
                  </span>
                  <div class="about-curriculum mb-30">
                    <h4>课程章节</h4>
                    <transition name="fade-transform" mode="out-in"
                                v-for="chapter in detail.chapters" :key="chapter.chapter.id">
                      <div class="chapter-container">
                        <p>{{ chapter.chapter.title }}</p>
                        <div class="section-container"
                             v-for="section in chapter.sections" :key="section.section.id">
                          <p class="section-title" @click="handleClickSection(section.section)">
                            {{ section.section.title }}
                            <span class="section-learn-hour">
                              <i class="el-icon-caret-right"></i>&nbsp;{{
                                section.section.learnHour
                              }}小时
                            </span>
                          </p>
                          <div class="point-container" v-for="point in section.points"
                               :key="point.id">
                            <p class="point-title" @click="handleClickPoint(section.section, point)">
                              {{ point.title }}
                              <span class="section-learn-hour">
                              <i class="el-icon-caret-right"></i>&nbsp;{{
                                  point.learnHour
                                }}小时
                            </span>
                            </p>
                          </div>
                        </div>
                      </div>
                    </transition>
                  </div>
                </el-tab-pane>
                <el-tab-pane name="evaluate">
                  <span slot="label">
                    <el-button type="default" class="course-content-btn">课程评价</el-button>
                  </span>
                  <div class="about-review mb-30">
                    <h4>课程评价</h4>
                    <div>
                      <el-form :model="evaluate">
                        <el-form-item label="">
                          <el-input type="textarea" :rows="3" placeholder="请输入评价内容"
                                    v-model="evaluate.evaluateContent"></el-input>
                        </el-form-item>
                        <el-form-item label="">
                          <el-rate v-model="evaluate.evaluateLevel"></el-rate>
                        </el-form-item>
                        <el-form-item>
                          <el-button type="primary" class="clever-btn"
                                     @click="handleSubmitEvaluate">提交
                          </el-button>
                        </el-form-item>
                      </el-form>
                    </div>
                    <div>
                      <div class="user-evaluate-item" v-for="e in evaluates" :key="e.id">
                        <el-row>
                          <el-col :span="3">
                            {{ e.operatorName }}
                          </el-col>
                          <el-col :span="21">
                            <div>
                              <el-rate v-model="e.evaluateLevel" :disabled="true"></el-rate>
                            </div>
                            <div class="user-evaluate-item-content">
                              {{ e.evaluateContent }}
                            </div>
                            <div class="user-evaluate-item-time">
                              {{ e.createTime }}
                            </div>
                          </el-col>
                        </el-row>
                      </div>
                    </div>
                  </div>
                </el-tab-pane>
                <el-tab-pane name="members">
                  <span slot="label">
                    <el-button type="default" class="course-content-btn">报名学员</el-button>
                  </span>
                  <div class="about-members mb-30">
                    <h4>报名学员</h4>
                    <p>已报名学员：{{ detail.memberCount }}</p>
                  </div>
                </el-tab-pane>
                <el-tab-pane>
                  <span slot="label">
                    <el-button type="default" class="course-content-btn">学习交流</el-button>
                  </span>
                  <div class="about-review mb-30">
                    <h4>学习交流</h4>
                    <p></p>
                  </div>
                </el-tab-pane>
              </el-tabs>
            </el-col>
            <el-col :span="6">
              <div class="course-sidebar">
                <el-button type="primary" class="clever-btn mb-30 w-100" @click="handleJoin">
                  {{ joinBtnText }}
                </el-button>
                <div class="sidebar-widget">
                  <h4>课程特色</h4>
                  <ul class="features-list">
                    <li>
                      <h6><i class="el-icon-alarm-clock"></i>课时</h6>
                      <h6>{{ detail.learnHour }}</h6>
                    </li>
                    <li>
                      <h6><i class="el-icon-bell"></i>章节</h6>
                      <h6>{{ detail.chapterSize }}</h6>
                    </li>
                    <li>
                      <h6><i class="el-icon-files"></i>学员数</h6>
                      <h6>{{ detail.memberCount }}</h6>
                    </li>
                    <li>
                      <h6><i class="el-icon-files"></i>好评数</h6>
                      <h6>{{ evaluates.length }}</h6>
                    </li>
                  </ul>
                </div>
                <div class="sidebar-widget">
                  <h4>猜你喜欢</h4>
                  <div class="single--courses d-flex align-items-center" v-for="course in likes"
                       :key="course.id">
                    <div class="thumb">
                      <img src="static/img/bg-img/yml.jpg" alt="">
                    </div>
                    <div class="content">
                      <h5>{{ course.courseName }}</h5>
                      <h6>{{ course.price }}</h6>
                    </div>
                  </div>
                </div>
              </div>
            </el-col>
          </el-row>
        </div>
      </div>
    </transition>
  </div>
</template>
<script>
import {getCourseDetail, joinCourse} from '@/api/exam/course'
import {addObj, getEvaluateList} from '@/api/exam/courseEvaluate'
import {messageSuccess, messageWarn} from '@/utils/util'

export default {
  data() {
    return {
      loading: true,
      courseId: '',
      course: {},
      detail: {},
      value: 3.7,
      activeName: 'desc',
      evaluate: {
        evaluateContent: '',
        evaluateLevel: 5
      },
      likes: [{
        id: 1,
        courseName: '应用文写作',
        price: '$20'
      }],
      evaluates: [],
      hasEvaluate: false,
      joinBtnText: ''
    }
  },
  created() {
    this.courseId = this.$route.query.courseId
    this.getCourseInfo()
    this.getEvaluateList()
  },
  methods: {
    getCourseInfo() {
      this.loading = true
      getCourseDetail(this.courseId).then(res => {
        this.detail = res.data.result
        this.course = res.data.result.course
        this.joinBtnText = this.detail.isUserJoin === true ? '取消报名' : '报名'
        setTimeout(() => {
          this.loading = false
        }, 500)
      }).catch(error => {
        console.error(error)
        this.loading = false
      })
    },
    getEvaluateList() {
      getEvaluateList({courseId: this.courseId}).then(res => {
        const {code} = res.data
        if (code === 0) {
          this.evaluates = res.data.result.list
        }
      }).catch(error => {
        console.error(error)
      })
    },
    handleClick(tab, event) {

    },
    handleClickSection(section) {
      if (this.detail.isUserJoin !== true) {
        messageWarn(this, '请先报名')
        return
      }
      this.$router.push({
        name: 'course-section',
        query: {sectionId: section.id, courseId: this.courseId}
      })
    },
    handleClickPoint(section, point) {
      if (this.detail.isUserJoin !== true) {
        messageWarn(this, '请先报名')
        return
      }
      this.$router.push({
        name: 'course-section',
        query: {sectionId: section.id, courseId: this.courseId, pointId: point.id}
      })
    },
    handleSubmitEvaluate() {
      if (this.detail.isUserJoin !== true) {
        messageWarn(this, '请先报名')
        return
      }
      if (this.hasEvaluate) {
        messageWarn(this, '请勿重复提交')
        return
      }
      if (this.evaluate.evaluateContent === '') {
        this.evaluate.evaluateContent = '用户默认好评'
      }
      addObj({
        courseId: this.courseId,
        ...this.evaluate
      }).then(res => {
        if (res.data.code === 0) {
          this.evaluate.evaluateContent = ''
          this.hasEvaluate = true
          messageSuccess(this, '提交成功')
          this.getEvaluateList()
        } else {
          messageWarn(this, '提交失败')
        }
      }).catch(error => {
        console.error(error)
      })
    },
    handleJoin() {
      const type = this.detail.isUserJoin ? '0' : '1'
      const text = this.detail.isUserJoin ? '取消报名' : '报名'
      this.$confirm('确定' + text + '吗?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        joinCourse(this.courseId, type).then(res => {
          if (res.data.result) {
            messageSuccess(this, text + '成功')
            this.getCourseInfo()
          }
        }).catch(error => {
          console.error(error)
          messageWarn(this, text + '失败')
        })
      }).catch(error => {
        console.error(error)
      })
    }
  }
}
</script>

<style lang="scss" rel="stylesheet/scss" scoped>
.course-content-btn {
  display: inline-block;
  height: 40px;
  background-color: transparent;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 1px;
  font-size: 14px;
  border-radius: 6px;
  padding: 0 25px;
  line-height: 40px;
  -webkit-transition-duration: 800ms;
  transition-duration: 800ms;
  text-align: center;
  margin-right: 10px;
  margin-bottom: 10px;
}
.clever-btn {
  display: inline-block;
  min-width: 160px;
  height: 40px;
  background-color: #3762f0;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 1px;
  font-size: 14px;
  color: #ffffff;
  border: 1px solid transparent;
  border-radius: 6px;
  padding: 0 30px;
  line-height: 40px;
  text-align: center;
  -webkit-transition-duration: 300ms;
  transition-duration: 300ms;
}
.my-content-container {
  margin-top: 0;
}
.section-title {
  margin-left: 16px;
  font-size: 14px;
  cursor: pointer;
}
.section-title:hover, .section-learn-hour:hover {
  color: #409EFF;
}
.section-learn-hour {
  float: right;
  color: rgba(0, 0, 0, .3);
}
.user-evaluate-item {
  margin-top: 20px;
}
.user-evaluate-item-content {
  margin-top: 10px;
}
.user-evaluate-item-time {
  font-size: 12px;
  margin-top: 8px;
  color: rgba(0, 0, 0, .3);
}
.point-container {
  margin-left: 32px;
}
.point-title {
  font-size: 14px;
  cursor: pointer;
}
.point-title:hover {
  color: #409EFF;
}
</style>
