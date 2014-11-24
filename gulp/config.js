var dest = "./public",
  src = "./app/assets/src";

module.exports = {
  src: src,
  dest: dest,
  
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
    }
  },

  deploy: {

    // Configure deployment-related environment variables for static sites on S3.

    s3: {
      key: 'AWS_ACCESS_KEY_ID',
      secret: 'AWS_SECRET_ACCESS_KEY',
      bucket: 'S3_BUCKET',
      region: 'S3_REGION'
    }
  }
};
