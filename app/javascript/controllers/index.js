// Import and register all your controllers from the importmap under controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

// PatientSearchControllerを明示的に登録
import PatientSearchController from "./patient_search_controller"
application.register("patient-search", PatientSearchController)

eagerLoadControllersFrom("controllers", application)