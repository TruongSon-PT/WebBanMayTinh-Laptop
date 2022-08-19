package su22.sof3021.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import su22.sof3021.entities.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
}
