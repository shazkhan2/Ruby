# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "rails-ujs", to: "https://cdnjs.cloudflare.com/ajax/libs/rails-ujs/7.1.3-4/rails-ujs.min.js", preload: true

pin_all_from "app/javascript/controllers", under: "controllers"
