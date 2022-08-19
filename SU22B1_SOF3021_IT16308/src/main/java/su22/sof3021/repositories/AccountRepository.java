package su22.sof3021.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import su22.sof3021.entities.Account;
@Repository
public interface AccountRepository extends JpaRepository<Account, Integer> {
	@Query("SELECT a FROM Account a WHERE a.username = :username")
	Account findByUsername(@Param("username") String username);
	
	@Query("SELECT a FROM Account a WHERE a.admin = 0 and a.activated = :activated")
	Page<Account> findAllStaffFilter(@Param("activated") Integer activated, Pageable pageable);
	
	@Query("SELECT a FROM Account a WHERE a.admin = 0")
	Page<Account> findAllStaff(Pageable pageable);
	
	@Query("SELECT a FROM Account a WHERE a.admin = 2")
	Page<Account> findAllClient(Pageable pageable);
}
