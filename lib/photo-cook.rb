require 'fileutils'
require 'pathname'
require 'rake'
require 'mini_magick'
require 'open3'
require 'base64'

require 'photo-cook/dimensions'
require 'photo-cook/dirs'
require 'photo-cook/command'
require 'photo-cook/assemble'
require 'photo-cook/resizer'
require 'photo-cook/middleware'
require 'photo-cook/magick-photo'
require 'photo-cook/carrierwave'
require 'photo-cook/resize-api'
require 'photo-cook/size-formatting'
require 'photo-cook/events'
require 'photo-cook/benchmark'
require 'photo-cook/mode'
require 'photo-cook/calculations'
require 'photo-cook/symlink'

require 'photo-cook/optimization/abstract-optimizer'
require 'photo-cook/optimization/image-optim'
require 'photo-cook/optimization/optimization-api'
require 'photo-cook/optimization/optimization-job' if defined?(Rails)
require 'photo-cook/engine' if defined?(Rails)
require 'photo-cook/logging'
