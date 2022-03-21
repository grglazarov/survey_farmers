<template>
  <div id="app">
    <div>
    <button
      v-on:click="hide = !hide"  
      class="show-tool"
    >Hilfe</button>  
    </div>
    <div
      class="card-tools"
      v-if="!hide">
    <p style="text-align: justify-all; font-family:sans-serif;font-size:12px; color: white">{{helpText}}</p>
      <hr />
      <!-- <center>
        <button style="font-size:14px; color:#696968; align-items:center"
          class="hide-tool"
          v-on:click="isHidden = !isHidden"
        >Ausblenden </button>
      </center> -->
    </div>    
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

/* button {
  margin: 10px;
  border-radius: 5px;
  border: 1px solid #999;
  font-size: 14px;
  padding-right: 10px;
  padding-left: 10px;
  padding-top: 5px;
  padding-bottom: 5px;
} */

/* .hide-tool {
  background-color: #fafafa;
  border: 1px solid #bbb;
  width: 120px;
  height: 40px;
  left: 5px;
} */

button:hover {
background-color: #ffffff;
}

.card-tools {
  font-size: 20px; 
  top: 5px;
  padding: 8px;
  background-color: #214b81;
  border: 1px solid #bbb;
  width: 100%;
  z-index: 100;
  position: relative;
  box-shadow: rgba(10, 9, 9, 0.3) 0px 1px 4px -1px;
}


.show-tool {
  font-size: 15px; 
  font-weight: bold;
  color: black; 
  opacity: 0.85; 
  background-color: rgb(233, 225, 225);
  background-repeat: no-repeat;
  border: 1px solid #bbb;
  border-radius: 50%;
  padding: 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
