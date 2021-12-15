<template>
  <div id="app">
    <div
      class="card-tools"
      v-if="!isHidden">
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
      v-on:click="isHidden = !isHidden"
      style="font-size:20px; position: fixed; color:#696969; align-items:center"
      class="show-tool"
    >Hilfe</button>  
 </div>
</template>

<script>
  export default {
    name: "modals",
    props: ['helpText'],
    data () {
      return {
        isHidden: true,
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
  color: #484b49;
  margin: 10px;
  border-radius: 5px;
  background-color: white;
  border: 1px solid #999;
  font-size: 1.05em;
  padding-right: 10px;
  padding-left: 10px;
  padding-top: 5px;
  padding-bottom: 5px;
}


.card-tools {
  top: 5px;
  padding: 8px;
  background-color: #2c4566;
  border: 1px solid #bbb;
  width: 100%;
  z-index: 100;
  position: relative;
  box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px;
}
.hide-tool {
  background-color: #fafafa;
  border: 1px solid #bbb;
  width: 120px;
  height: 40px;
  left: 5px;
}

.show-tool {
  left: 5px;
  position: relative;
  top: 5px;
  width: 140px;
  height: 140px;
  right: 5px;
  background-color: #fafafa;
  border: 1px solid #bbb;
  z-index: 100;
}
</style>
