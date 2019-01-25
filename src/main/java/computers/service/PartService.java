package computers.service;

import computers.model.Part;

import java.util.List;

/**
 * Part service
 *
 * @author Sergey Filippov (serdg1984@yandex.ru).
 * @version 1.0.
 * @since 23.01.19
 */
public interface PartService {
    void addPart(Part part);

    void updatePart(Part part);

    void removeBook(int id);

    Part getPartById(int id);

    List<Part> listParts();

    List<Part> selectNeeded();

    List<Part> selectNoNeeded();

    int countOfComputer();

    Part getPartByName(String name);


    List<Part> listNext();

    void listPrevious();

    List list();

    List currentList();

    List getFullList();

    void redirectFrom();

}
