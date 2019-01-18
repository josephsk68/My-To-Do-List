package myToDoList.dao;

import org.springframework.data.repository.CrudRepository;

import myToDoList.model.Task;

public interface TaskRepository extends CrudRepository<Task, Integer> {
}
