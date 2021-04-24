<template>
  <div>
    <button class="button buttonWidthBig">{{text}}</button>
  </div>
</template>
<script>
export default {
  props: ['text'],
  data () {
    return {
    }
  }
}
</script>
<style lang="sass">
@import '../Style/StyleAll'
@import '../Style/Variables'

.buttonWidthBig
  width: 100%
</style>