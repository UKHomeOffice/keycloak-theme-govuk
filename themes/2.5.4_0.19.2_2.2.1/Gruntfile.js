module.exports = function (grunt) {
  var fs = require("fs"),
      packageDotJson       = JSON.parse( fs.readFileSync('package.json', 'utf8') ),
      govukTemplateVersion = packageDotJson.dependencies["govuk_template_jinja"],
      govukElementsVersion = packageDotJson.dependencies["govuk-elements-sass"],
      themeDirectory       = ["govuk", govukTemplateVersion, govukElementsVersion].join("_"),
      css_output_paths_to_sass_paths = {};

  [
    "govuk_elements",
    "govuk_elements-ie8",
    "govuk_elements-ie7",
    "govuk_elements-ie6"
  ]
  .forEach(function (fileName) {
    var sassPath = 'sass/'+fileName+'.scss',
        cssPath = themeDirectory+'/login/resources/css/'+fileName + '.css';

    css_output_paths_to_sass_paths[cssPath] = sassPath;
  });

  grunt.initConfig({

    clean: {
      contents: [
        'sass/vendor/*',
        themeDirectory+'/login/resources/css/*',
        themeDirectory+'/login/resources/vendor/*'
      ]
    },

    copy: {
      govuk_template: {
        files: [{
          expand: true,
          cwd: 'node_modules/govuk_template_jinja/assets/',
          src: '**',
          dest: themeDirectory+'/login/resources/vendor/govuk_template/'
        }]
      },
      govuk_frontend_toolkit: {
        files: [{
          expand: true,
          cwd: 'node_modules/govuk_frontend_toolkit/stylesheets/',
          src: '**',
          dest: 'sass/vendor/govuk_frontend_toolkit/'
        },
        {
          expand: true,
          cwd: 'node_modules/govuk_frontend_toolkit/images/',
          src: '**',
          dest: themeDirectory+'/login/resources/vendor/govuk_frontend_toolkit/images/'
        }]
      },
      govuk_elements: {
        files: [{
          expand: true,
          cwd: 'node_modules/govuk-elements-sass/public/sass/elements/',
          src: '**',
          dest: 'sass/vendor/govuk-elements-sass/'
        }]
      }
    },

    sass: {
      dev: {
        files: css_output_paths_to_sass_paths,
        options: {
          imagePath: themeDirectory+'/login/resources/img'
        }
      }
    }

  });

  [
    'grunt-contrib-clean',
    'grunt-contrib-copy',
    'grunt-sass'
  ].forEach(function (task) {
    grunt.loadNpmTasks(task);
  })

  grunt.registerTask('default', ['clean', 'copy', 'sass']);
}