package computers.dao;

import computers.model.Part;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Part dao implementation
 *
 * @author Sergey Filippov (serdg1984@yandex.ru).
 * @version 1.0.
 * @since 23.01.19
 */
@Repository
public class PartDaoImpl implements PartDao {
    private static final Logger logger = LoggerFactory.getLogger(PartDaoImpl.class);
    private SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @Transactional
    public void addPart(Part part) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(part);
        logger.info("Part successfully removed. Book details: " + part);
    }

    @Override
    @Transactional
    public void updatePart(Part part) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(part);
        logger.info("Part successfully update. Part details: " + part);
    }

    @Override
    @Transactional
    public void removePart(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Part part = (Part) session.load(Part.class, new Integer(id));
        if(part !=null){
            session.delete(part);
        }
        logger.info("Part successfully removed. Book details: " + part);
    }

    @Override
    @Transactional
    public Part getPartById(int id) {
        Session session =this.sessionFactory.getCurrentSession();
        Part part = (Part) session.load(Part.class, new Integer(id));
        logger.info("Part successfully loaded. Book details: " + part);
        return part;
    }

    @Override
    @Transactional
    public List<Part> listParts() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Part> partList = session.createQuery("from Part").list();
        for(Part part: partList){
            logger.info("Partk list: " + part);
        }
        return partList;
    }
}
