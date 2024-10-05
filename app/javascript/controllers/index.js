// Import and register all your controllers from the importmap under controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

// 以下の2行を削除または注釈化してください
// import PatientSearchController from "./patient_search_controller"
// application.register("patient-search", PatientSearchController)

eagerLoadControllersFrom("controllers", application)