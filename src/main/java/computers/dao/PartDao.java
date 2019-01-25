package computers.dao;

import computers.model.Part;

import java.util.List;

/**
 * Part dao
 *
 * @author Sergey Filippov (serdg1984@yandex.ru).
 * @version 1.0.
 * @since 23.01.19
 */
public interface PartDao {
    void addPart(Part part);

    void updatePart(Part part);

    void removePart(int id);

    Part getPartById(int id);

    List<Part> listParts();
}
