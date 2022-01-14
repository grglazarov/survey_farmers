<template>
  <div id="app">
    <img class="resize" style="width:100%" alt="Phenorob logo" src="./assets/sugarbeet_logo.png">
    <keep-alive>
    <survey/>
    </keep-alive>
  </div>
</template>

<script>
import survey from './components/survey.vue'

export default {
  name: 'App',
  components: {survey}
}
</script>
<style>
/* this is called a style reset as browser has a default one */
/* * {
    margin: 0;
    padding: 0;
    border: 0;
    outline: 0;
    font-size: 100%;
    vertical-align: baseline;
} */
</style>

// !!! added keep alive and type = method to the script