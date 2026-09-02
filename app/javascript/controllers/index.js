import { application } from "controllers/application"
import CopyTasksController from "controllers/copy_tasks_controller"
import FitTextController from "controllers/fit_text_controller"
import InlineEditController from "controllers/inline_edit_controller"
import KeyboardFocusController from "controllers/keyboard_focus_controller"
import TaskCheckboxController from "controllers/task_checkbox_controller"

application.register("copy-tasks", CopyTasksController)
application.register("fit-text", FitTextController)
application.register("inline-edit", InlineEditController)
application.register("keyboard-focus", KeyboardFocusController)
application.register("task-checkbox", TaskCheckboxController)
