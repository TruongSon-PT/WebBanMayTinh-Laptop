package su22.sof3021.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import su22.sof3021.entities.OrderDetail;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer>{
	
}
