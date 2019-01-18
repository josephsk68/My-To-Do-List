package myToDoList.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import myToDoList.dao.TaskRepository;
import myToDoList.model.Task;

@Service
@Transactional
public class TaskService {
	
	private final TaskRepository taskRepository;

	public TaskService(TaskRepository taskRepository) {
		this.taskRepository = taskRepository;
	}
	
	public List<Task> findAll() {
		List<Task> tasks = new ArrayList<Task>();
		for(Task task : taskRepository.findAll()) {
			tasks.add(task);
		}
		return tasks;
	}
	
	public void add(Task task) {
		taskRepository.save(task);
	}
	
	public void delete(int id) {
		taskRepository.deleteById(id);
	}

	public Task findOneTask(int id) {
		return taskRepository.findById(id).orElse(null);
	}
	
}
