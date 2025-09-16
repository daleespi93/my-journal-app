// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

function highlightTask(taskId) {
  const taskElement = document.getElementById(`task_${taskId}`);
  taskElement.classList.toggle("bg-yellow-100");
}

window.highlightTask = highlightTask;
