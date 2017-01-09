<template>
    <div class="com-card">
        <div class="bg-stars" id="bg-stars"></div>
        <div class="info">
            <h1 class="name">宁宁</h1>
            <div class="avatar">
                <img src="../assets/avatar.png">
            </div>
            <h1 class="say">hi! 软件能干的事, 你别干.</h1>            
        </div>
    </div>
</template>

<script>
export default {
  name: 'MyCard',

  mounted(){
    this.$store.commit('set_card_height', this.$el.innerHeight);

    particlesJS('bg-stars', {
        particles: {
            "number": {
                "value": 30,
                "density": {
                    "enable": true,
                    "value_area": 300
                }
            },
            "color": {
                "value": "#9e9e9e"
            },
            "shape": {
                "type": "circle",
                "stroke": {
                    "width": 0,
                    "color": "#9e9e9e"
                },
                "polygon": {
                    "nb_sides": 5
                }
            },
            "opacity": {
                "value": 0.5,
                "random": false,
                "anim": {
                    "enable": false,
                    "speed": 1,
                    "opacity_min": 0.1,
                    "sync": false
                }
            },
            "size": {
                "value": 5,
                "random": true,
                "anim": {
                    "enable": false,
                    "speed": 40,
                    "size_min": 0.1,
                    "sync": false
                }
            },
            "line_linked": {
                "enable": true,
                "distance": 150,
                "color": "#9e9e9e",
                "opacity": 0.4,
                "width": 1
            },
            "move": {
                "enable": true,
                "speed": 1,
                "direction": "none",
                "random": false,
                "straight": false,
                "out_mode": "out",
                "attract": {
                    "enable": false,
                    "rotateX": 600,
                    "rotateY": 1200
                }
            }
        }
    });
  }

}
</script>

<style lang=scss scoped>
@mixin textCenter($size: 0.14rem, $color: rgba(0, 0, 0, 0.61)) {
    text-align: center;
    font-size: $size;
    color: $color;
    font-weight: 100;
}

.com-card{background-color: #eee; padding: 0.15rem;box-shadow: 1px 2px 50px rgba(#444, 0.1);border-radius: 0 0 0 0;position: relative;overflow: hidden;
    >.bg-stars{
        position: absolute;z-index: 1;width: 100%;height: 100%;
    }
    >.info{position: relative;z-index: 1986;
        .name{ @include textCenter(0.24rem);margin-top: 0.15rem;letter-spacing: 2px;}
        .avatar{width: 1.2rem; height: 1.2rem;margin: 0.15rem auto;border-radius: 100%;
            img{display: block;width: 100%;}
        }
        .say{ @include textCenter(0.18rem);margin: 0.3rem auto 0.15rem; letter-spacing: 2px;}
    }

}
</style>
