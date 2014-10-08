var dest = "./public",
  src = "./src";

module.exports = {
  scss: {
    src: src + "/scss/**/*.scss",
    dest: dest + "/css"
  },

  assets: {
    fonts: {
      src: src + "/fonts/**",
      dest: dest + "/fonts"
    },

    images: {
      src: src + "/images/**",
      dest: dest + "/images"
    },

    html: {
      src: src + "/*.html",
      dest: dest
    }
  }
}
