<template>
  <div>
    <button class="button buttonWidthMini" @click="comeBack">{{text}}</button>
  </div>
</template>
<script>
export default {
 props: ['text'],
  data () {
    return {
    }
  },
   methods: {
   comeBack () {
     this.$emit('comeBack')
   }
  }
}
</script>
<style lang="sass">
@import '../Style/StyleAll'
@import '../Style/Variables'

.buttonWidthMini
  width: 130px
  opacity: .5
  @media (max-width: 900px)
    width: 130px
  @media (max-width: 600px)
    width: 120px
  @media (max-width: 450px)
    width: 110px

</style>