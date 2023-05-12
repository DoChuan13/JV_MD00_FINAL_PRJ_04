package module04.projectmd04.service.generic;

import java.util.List;

public interface IGenericService<T> {
    List<T> findAll();

    void save(T t);

    T findById(int id);

    void delete(int id);
}
