<template>
  <transition name="fade">
    <div class="modal" v-if="showPopup">
      <div class="modal__backdrop" @click="closeModal()"/>

      <div class="modal__dialog">
        <div class="modal__header">
          <slot name="header"/>
        </div>

        <div class="modal__body">
          <slot name="body"/>
        </div>

        <div class="modal__footer">
          <slot name="footer"/>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
export default {
  name: "Modal",
  props: ["showPopup"],
  data() {
    return {
    };
  },
  mounted () {
    if (this.showPopup == true) {
      document.querySelector("body").classList.add("overflow-hidden");
    }
    else {
      document.querySelector("body").classList.remove("overflow-hidden");
    }
  },

  methods: {
    closeModal() {
      this.showPopup = false;
      document.querySelector("body").classList.remove("overflow-hidden");
    },
    openModal() {
      this.showPopup = true;
      document.querySelector("body").classList.add("overflow-hidden");
    }
  }
};
</script>


<style lang="scss" scoped>
.modal {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 9;
  overflow-x: hidden;
  overflow-y: auto;
  &__backdrop {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-color: rgba(0, 0, 0, 0.3);
    z-index: 1;
  }
  &__dialog {
    position: relative;
    width: 600px;
    background-color: #ffffff;
    border-radius: 5px;
    margin: 50px auto;
    display: flex;
    flex-direction: column;
    z-index: 2;
    @media screen and (max-width: 992px) {
      width: 90%;
    }
  }
  &__close {
    width: 30px;
    height: 30px;
    background-color: #c5c5c5;

  }
  &__header {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    padding: 20px 20px 10px;
  }
  &__body {
    padding: 10px 20px 10px;
    background: #202b38;
    overflow: auto;
    display: flex;
    
    flex-direction: column;
    align-items: stretch;
  }
  &__footer {
    padding: 10px 20px 20px;
  }
}
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.2s;
}
.fade-enter,
.fade-leave-to {
  opacity: 0;
}
</style>
