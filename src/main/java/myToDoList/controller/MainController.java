package myToDoList.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import myToDoList.model.Task;
import myToDoList.service.TaskService;

@Controller
public class MainController {
	
	@Autowired
	private TaskService taskService;
	
	@GetMapping("/")
	public String home(HttpServletRequest request) {
		request.setAttribute("page", "MAIN");
		return "index";
	}

	@GetMapping("/allTasks")
	public String allTasks(HttpServletRequest request) {
		request.setAttribute("jstl_tasks", taskService.findAll());
		request.setAttribute("page", "TASKS");
		return "index";
	}

	@PostMapping("/addTask")
	public String addTask(@ModelAttribute Task task, BindingResult bindingResult, HttpServletRequest request) {
		task.setDateCreated(new Date());
		taskService.add(task);
		request.setAttribute("jstl_tasks", taskService.findAll());
		request.setAttribute("page", "TASKS");
		return "index";
	}
	
	@GetMapping("/newTask")
	public String newTask(HttpServletRequest request) {
		request.setAttribute("page", "NEWTASK");
		return "index";
	}
	
	@GetMapping("/retrieveTask")
	public String retrieveTask(@RequestParam int id, HttpServletRequest request) {
		request.setAttribute("jstl_task", taskService.findOneTask(id));	// one task
		request.setAttribute("page", "UPDATETASK");
		return "index";
	}
	
	@GetMapping("/removeTask")
	public String removeTask(@RequestParam int id, HttpServletRequest request) {
		taskService.delete(id);
		request.setAttribute("jstl_tasks", taskService.findAll());
		request.setAttribute("page", "TASKS");	
		return "index";
	}
}
