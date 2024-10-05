// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

import PatientSearchController from "./patient_search_controller"
application.register("patient-search", PatientSearchController)

eagerLoadControllersFrom("controllers", application)