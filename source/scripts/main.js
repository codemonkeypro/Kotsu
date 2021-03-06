// Uncomment if you need to support advanced ES6 features in IE11 and below
// import 'babel-polyfill'

import data from '@data'
import './utils/dom-polyfills'

const { SITE, ENV } = data

console.log(`${SITE.name} v${SITE.version} #${ENV.buildNumber}, SHA1 ${ENV.buildSHA1}`)

document.querySelector('html').classList.remove('no-js')
