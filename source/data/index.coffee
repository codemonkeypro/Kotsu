{ merge } = require('lodash')
{ join } = require('path')
pkg = require('../../package.json')

module.exports = ({ config }) ->
  { env, path, file, locales, baseLocale } = config()

  cwd = process.cwd()
  sitename = env.sitename
  buildRoot = path.build.root + '/'
  imagesPath = path.build.images.replace(buildRoot, '')

  data =
    PATH:
      fonts: path.build.fonts.replace(buildRoot, '')
      images: imagesPath
      scripts: path.build.scripts.replace(buildRoot, '')
      styles: path.build.styles.replace(buildRoot, '')
      sprites: path.build.sprites.replace(buildRoot, '')
      source: path.source
      build: path.build
    SITE:
      name: pkg.name
      shortName: pkg.name
      version: pkg.version
      description: pkg.description
      homepage: if sitename then "https://#{sitename}" else pkg.homepage
      logo: join(imagesPath, '/logo.svg')
      viewport: 'width=device-width, initial-scale=1'
      themeColor: '#313840'
      locales: locales
      baseLocale: baseLocale
      matter: () => require(join(cwd, file.temp.data.matter))
      images: () => require(join(cwd, file.temp.data.images))
      googleAnalyticsId: false # 'UA-XXXXX-X'
      yandexMetrikaId: false # 'XXXXXX'
    PLACEHOLDERS:
      company: pkg.name
    PAGE_DEFAULTS:
      image: ''
      class: ''
      bodyClass: ''
      applyWrapper: true
      showContentTitle: true
      showBreadcrumb: true
      showSidebar: false
    SOCIAL: # Add any other social services following same pattern
      twitter:
        handle: pkg.twitter
        image: join(imagesPath, '/twitter.png')
        url: "https://twitter.com/#{pkg.twitter}"
      facebook:
        image: join(imagesPath, '/facebook.png')
        url: 'https://www.facebook.com/Lotus-TM-647393298791066/'
    ENV:
      production: env.production
      staging: env.staging
      build: env.build
      hotModuleRloading: env.hotModuleRloading

  return (locale) -> switch locale
    when 'ru-RU' then merge {}, data
    else data
