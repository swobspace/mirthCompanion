// app/javascript/controllers/index.js
import { Application } from "@hotwired/stimulus"
const application = Application.start()

// Configure Stimulus development experience
application.warnings = true
application.debug = false
window.Stimulus = application

export { application }

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import DatatablesController from "./datatables_controller"
application.register("datatables", DatatablesController)

import ToggleController from "./toggle_controller"
application.register("toggle", ToggleController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)

import BstabsController from "./bstabs_controller"
application.register("bstabs", BstabsController)
