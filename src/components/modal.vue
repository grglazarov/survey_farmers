<template>
<div class="help" id="app">
  
  <div class="question">?</div>

  <div class="popup">
    <h3>Brauchen Sie Hilfe?</h3>
    <p style="text-align: justify-all; font-family:sans-serif;font-size:12px; color: black">{{helpText}}</p>
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

.help {
  width: 40px;
  margin: 0 auto;
}

.help .question {
  height: 40px;
  position: relative;
  width: 40px;
  background: rgb(88, 142, 185);
  font-size: 32px;
  line-height: 40px;
  text-align: center;
  border-radius: 50%;
  cursor: pointer;
}

.help .popup, .help .popup2 {
  width: 560px;
  height: 0px;
  text-align: left;
  overflow: hidden;
  position: relative;
  background: #eee;
  opacity: 0;
  transition: 1s;
}

.help .popup {
  left: -260px;
  top: 10px;
}

.help:hover .popup {
  opacity: 1;
  height: 120px;
  
}

.help .popup h3 {
  margin: 0;
  padding: 10px 0 0 10px;
  height: 30px;
  background: rgb(28, 58, 87);
  color: #fff;
  font-weight: 400;
  font-size: 18px;
}

.help .popup p {
  font-size: 16px;
  padding: 10px;
  margin: 0;
}

.help .popup .popup2 .sub-levels {
  padding: 0 0 10px 140px;
}

.help .popup .popup2 .sub-levels strong {
  font-size: 20px;
}

.help .popup .popup2 p:nth-child(5) {
  padding: 20px 0 0 10px;
}

.help .popup a {
  text-decoration: none;
  color: #317eac;
}

.help .popup a:visited {
  color: #317eac;
}

.help .popup p em {
  font-size: 12px;
}

</style>
