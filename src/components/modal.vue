<template>
  <div id="app">
    <div
      class="card-tools"
      v-if="tools">
      <center>
    <p style="text-align: justify-all; font-family:sans-serif;font-size:12px; color: white">
        {{helpText}}
    </p>
      </center>
      <hr />
      <center>
        <button style="font-size:12px; color:black; align-items:center"
          class="hide-tool"
          @click="displayTools(false)"
        >Ausblenden</button>
      </center>
    </div>
    <button
      style="font-size:12px; color:black; align-items:center"
      v-else
      class="show-tool"
      @click="displayTools(true)"
    >Hilfemodal Anzeigen</button>  
 </div>
</template>

<script>
  export default {
    name: "modals",
    props: ['helpText'],
    data () {
      return {
        tools: true,
        addMode: false
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
  left: 5px;
  top: 5px;
  padding: 8px;
  background-color: #2c4566;
  border: 1px solid #bbb;
  width: 270px;
  z-index: 100;
  position: fixed;
  box-shadow: rgba(0, 0, 0, 0.3) 0px 1px 4px -1px;
}
.hide-tool {
  background-color: #fafafa;
  border: 1px solid #bbb;
  font-size: 1.3em;
  left: 5px;
}

.show-tool {
  left: 5px;
  position: absolute;
  top: 5px;
  right: 5px;
  background-color: #fafafa;
  border: 1px solid #bbb;
  font-size: 1.3em;
  z-index: 100;
}
</style>
