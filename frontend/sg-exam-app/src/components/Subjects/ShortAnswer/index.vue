<template>
  <div>
    <div class="subject-content">
      <div class="subject-title">
        {{ subjectInfo.sort }}.
        <span class="subject-title-content"
              v-if="subjectInfo.score !== undefined && subjectInfo.score !== 0">&nbsp;({{ subjectInfo.score }}分)&nbsp;</span>
        <span class="subject-title-content" v-html="subjectInfo.subjectName"/>
      </div>
      <div class="subject-video-info" v-if="subjectInfo.subjectVideoId && subjectInfo.subjectVideoName">
        <sg-video ref="sgVideo"></sg-video>
      </div>
      <div class="subject-tinymce">
        <tinymce ref="shortAnswerEditor" :height="height" v-model="userAnswer"/>
      </div>
    </div>
  </div>
</template>

<script>
import Tinymce from '@/components/Tinymce'
import SgVideo from '@/components/SgVideo'
import {setVideoSrc, pauseVideo} from '@/utils/busi'

export default {
  name: 'ShortAnswer',
  components: {
    Tinymce,
    SgVideo
  },
  props: {
    height: {
      type: Number,
      required: false,
      default: 260
    },
    onChoice: {
      function() {
      }
    }
  },
  data() {
    return {
      subjectInfo: {
        subjectName: '',
        score: 0
      },
      userAnswer: ''
    }
  },
  methods: {
    getAnswer() {
      return this.userAnswer
    },
    setAnswer(answer) {
      this.userAnswer = answer
      if (this.$refs.shortAnswerEditor && this.userAnswer !== null) {
        this.$refs.shortAnswerEditor.setContent(this.userAnswer)
      }
      this.onChoice(this.subjectInfo.sort)
    },
    setSubjectInfo(subject) {
      this.subjectInfo = subject
      if (subject.hasOwnProperty('answer')) {
        this.setAnswer(subject.answer.answer)
      }
      setVideoSrc(subject, this.$refs)
    },
    getSubjectInfo() {
      return this.subjectInfo
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
  margin: 12px;
}
</style>
