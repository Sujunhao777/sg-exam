<template>
  <div>
    <div class="subject-content">
      <div class="subject-title">
        {{ subjectInfo.sort }}.
        <span class="subject-title-content"
              v-if="subjectInfo.score !== undefined && subjectInfo.score !== 0">&nbsp;({{
            subjectInfo.score
          }}分)&nbsp;</span>
        <span class="subject-title-content" v-html="subjectInfo.subjectName"/>
      </div>
      <div class="subject-video">
        <sg-video ref="sgVideo"></sg-video>
      </div>
      <div class="subject-tinymce">
        <tinymce ref="videoEditor" :height="height" v-model="userAnswer"/>
      </div>
    </div>
  </div>
</template>

<script>
import SgVideo from '@/components/SgVideo'
import Tinymce from '@/components/Tinymce'
import {pauseVideo} from '@/utils/busi'

export default {
  name: 'SVideo',
  components: {
    SgVideo,
    Tinymce
  },
  data() {
    return {
      subjectInfo: {
        subjectName: '',
        score: 0
      },
      options: [],
      userAnswer: ''
    }
  },
  props: {
    height: {
      type: Number,
      required: false,
      default: 110
    },
    onChoice: {
      function() {
      }
    }
  },
  watch: {
    userAnswer: {
      handler: function () {
        this.toggleOption()
      },
      immediate: true
    }
  },
  methods: {
    getAnswer() {
      return this.userAnswer
    },
    setAnswer(answer) {
      this.userAnswer = answer
      if (this.$refs.videoEditor && this.userAnswer !== null) {
        this.$refs.videoEditor.setContent(this.userAnswer)
      }
    },
    setSubjectInfo(subject) {
      this.subjectInfo = subject
      if (subject.hasOwnProperty('options')) {
        this.options = subject.options
      }
      if (subject.hasOwnProperty('answer')) {
        this.setAnswer(subject.answer.answer)
      }
      this.$refs.sgVideo.setSrc(subject.videoUrl)
    },
    getSubjectInfo() {
      this.subjectInfo.options = this.options
      return this.subjectInfo
    },
    toggleOption() {
      this.onChoice(this.subjectInfo.sort)
    },
    beforeSave() {
      pauseVideo(this.$refs)
    }
  }
}
</script>

<style lang="scss" scoped>
@import "../../../assets/css/subject.scss";

.subject-tinymce {
  margin-top: 20px;
  margin-bottom: 20px;
}
</style>
