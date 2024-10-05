import { application } from "./application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// 個別のコントローラーを登録する場合は以下のようにします
// import PatientSearchController from "./patient_search_controller"
// application.register("patient-search", PatientSearchController)