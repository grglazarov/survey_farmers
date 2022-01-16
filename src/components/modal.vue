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

button {
  margin: 10px;
  border-radius: 5px;
  border: 1px solid #999;
  font-size: 14px;
  padding-right: 10px;
  padding-left: 10px;
  padding-top: 5px;
  padding-bottom: 5px;
}
button:hover {
background-color: #ffffff;
}

.card-tools {
  top: 5px;
  padding: 8px;
  background-color: #2c4566;
  border: 1px solid #bbb;
  width: 100%;
  z-index: 100;
  position: relative;
  box-shadow: rgba(10, 9, 9, 0.3) 0px 1px 4px -1px;
}
.hide-tool {
  background-color: #fafafa;
  border: 1px solid #bbb;
  width: 120px;
  height: 40px;
  left: 5px;
}

.show-tool {
  background-color: rgb(233, 225, 225);
  background-repeat: no-repeat;
  opacity: 0.01;
  right: 5px;
  position: absolute;
  top: 5px;
  width: 15%;
  height: auto;
  right: 5px;
  border: 1px solid #bbb;
  z-index: 100;
}
</style>
