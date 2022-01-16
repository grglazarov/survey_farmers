<template>
  <div id="app">

    <div
      class="card-tools"
      v-if="!hide">
      <center>
    <p style="text-align: justify-all; font-family:sans-serif;font-size:12px; color: white">
        {{helpText}}
    </p>
      </center>
      <hr />
      <!-- <center>
        <button style="font-size:14px; color:#696969; align-items:center"
          class="hide-tool"
          v-on:click="isHidden = !isHidden"
        >Ausblenden</button>
      </center> -->
    </div>

    <button
      v-on:click="hide = !hide"  
      style="font-size: 30px; position: fixed; color: black; opacity: 0.85; align-items:center"
      class="show-tool"
    >Hilfe</button>  
    
 </div>
</template>

<script>
  export default {
    name: "modals",
    props: ['helpText', 'hideModal'],
    data () {
      return {
        hide: this.hideModal
      }
    },
    methods: {
      displayTools (value) {
        this.tools = value
      }
   }
}

</script>

<style>
</style>
